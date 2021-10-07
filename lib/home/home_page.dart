import 'package:diabetes/db/database.dart';
import 'package:diabetes/helper/widget/center_loading.dart';
import 'package:diabetes/helper/widget/fixed_header.dart';
import 'package:diabetes/helper/widget/show_delete_dialog.dart';
import 'package:diabetes/home/home_controller.dart';
import 'package:diabetes/home/rowitem.dart';
import 'package:diabetes/main/dark_light_controller.dart';
import 'package:diabetes/main/localizations_controller.dart';
import 'package:diabetes/modal/reader_type.dart';
import 'package:diabetes/modal/with_avg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends ConsumerWidget {
  static const routeName = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cont = ref.watch(homeContProvider);
    // final themeMode = ref.read(darkModeProvider.notifier)
    final state = cont.state;
    return SafeArea(
      child: Scaffold(
        body: state.map<Widget>(
            init: (_) => const CenterLoading(),
            loading: (_) => const CenterLoading(),
            loaded: (loaded) {
              final data = loaded.data;
              final length = data.data.length;
              final isEmpty = length == 0 || (length == 1 && cont.isLastEmpty);
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: AppBar(
                      title: Text(AppLocalizations.of(context)!.appTitle),
                      actions: [
                        IconButton(
                            onPressed: () {
                              showDeleteDialog(context, cont.clearAll);
                            },
                            icon: const Icon(Icons.delete_forever)),
                        IconButton(
                            onPressed: () {
                              ref.read(darkModeProvider.notifier).toggle();
                            },
                            icon:
                                Theme.of(context).brightness == Brightness.dark
                                    ? const Icon(Icons.brightness_3)
                                    : const Icon(Icons.brightness_6)),
                        PopupMenuButton<Locale>(
                            onSelected: (val) {
                              ref
                                  .read(localizationsProvider.notifier)
                                  .setTo(val.languageCode);
                            },
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                AppLocalizations.of(context)!.localeName,
                                style: Theme.of(context)
                                    .appBarTheme
                                    .titleTextStyle,
                              ),
                            )),
                            itemBuilder: (context) =>
                                LocalizationsController.supported
                                    .map((e) => PopupMenuItem(
                                          child: Text(e.languageCode),
                                          value: e,
                                        ))
                                    .toList())
                      ],
                    ),
                  ),
                  if (!isEmpty)
                    SliverToBoxAdapter(child: buildAvgMainCard(context, data)),
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: SliverFiexdHeaderDelegate(
                        child: buildFixedTitleCard(
                            context, ref, !cont.isLastEmpty),
                        height: 50),
                  ),
                  SliverList(
                      delegate: SliverChildBuilderDelegate((context, i) {
                    final e = data.data.elementAt(length - i - 1);
                    return buildItem(context, ref, data, e);
                  }, childCount: length)),
                ],
              );
            }),
      ),
    );
  }

  buildItem(
      BuildContext context,
      WidgetRef ref,
      ResultWithAvg<List<CalcWithAvg<Map<ReaderType, ReadItemData>>>> data,
      CalcWithAvg<Map<ReaderType, ReadItemData>> e) {
    final items = e.data;
    final readId = items.isEmpty ? null : items.entries.first.value.startDate;
    void onAddOrEdit(int number, ReaderType type, int? oldValue) {
      ref
          .read(homeContProvider.notifier)
          .addItemToRead(readId, number, type, oldValue != null, items);

      for (var element in [e, data.allAvg, data.monthAvg, data.threeMonthAvg]) {
        element.replaceOrAdd(oldValue, number);
      }
    }

    final date = e.data.values.firstOrNull?.startDate;
    return Card(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          RowItems(
            title: AppLocalizations.of(context)!.before,
            data: items,
            types: const [
              ReaderType.beforeBreakfast,
              ReaderType.beforeDinner,
              ReaderType.beforeLunch,
              ReaderType.beforeSleep
            ],
            onAddOrEdit: onAddOrEdit,
          ),
          const SizedBox(
            height: 10,
          ),
          RowItems(
            title: AppLocalizations.of(context)!.after,
            onAddOrEdit: onAddOrEdit,
            data: items,
            types: const [
              ReaderType.afterBreakfast,
              ReaderType.afterDinner,
              ReaderType.afterLunch,
              ReaderType.empty,
            ],
          ),
          if (date != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Text('${AppLocalizations.of(context)!.avg} : '),
                      Text(e.avg.toStringAsFixed(3)),
                    ],
                  ),
                  Row(
                    children: [
                      Text('${AppLocalizations.of(context)!.date} : '),
                      Text(DateFormat('dd / MM EEEE',
                              AppLocalizations.of(context)!.localeName)
                          .format((date)))
                    ],
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }

  Card buildFixedTitleCard(
      BuildContext context, WidgetRef ref, bool enableAdd) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (enableAdd)
              InkWell(
                  onTap: () {
                    ref.read(homeContProvider.notifier).addNewRead();
                  },
                  child: const Icon(Icons.add))
            else
              const SizedBox(),
            Text(AppLocalizations.of(context)!.breakfast),
            Text(AppLocalizations.of(context)!.dinner),
            Text(AppLocalizations.of(context)!.lunch),
            Text(AppLocalizations.of(context)!.sleep)
          ].map((e) => Expanded(child: Center(child: e))).toList(),
        ),
      ),
    );
  }

  Card buildAvgMainCard(BuildContext context,
      ResultWithAvg<List<CalcWithAvg<Map<ReaderType, ReadItemData>>>> data) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        spacing: 10,
        children: [
          Text(
              '${AppLocalizations.of(context)!.onemonthavg} : ${data.monthAvg.avg.toStringAsFixed(3)}'),
          Text(
              '${AppLocalizations.of(context)!.threemonthavg}  : ${data.monthAvg.avg.toStringAsFixed(3)}'),
          Text(
              '${AppLocalizations.of(context)!.allavg}  : ${data.allAvg.avg.toStringAsFixed(3)}'),
        ],
      ),
    ));
  }
}

class RowItems extends StatelessWidget {
  const RowItems({
    Key? key,
    required this.title,
    required this.data,
    required this.onAddOrEdit,
    required this.types,
  }) : super(key: key);
  final String title;
  final List<ReaderType> types;
  final Map<ReaderType, ReadItemData> data;
  final void Function(int number, ReaderType type, int? oldValue) onAddOrEdit;

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(title),
        ...types.map((e) {
          final item = data[e];
          if (e == ReaderType.empty) return const SizedBox();
          return RowItem(
            number: item?.number,
            onChange: () {
              showDialog(
                  context: context,
                  builder: (_) => AddToDialog(
                        number: item?.number,
                        type: e,
                        onDone: (numb) {
                          onAddOrEdit(numb, e, item?.number);
                        },
                      ));
            },
          );
        }),
      ].map((e) => Expanded(child: Center(child: e))).toList(),
    );
  }
}
