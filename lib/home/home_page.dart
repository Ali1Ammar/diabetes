import 'package:diabetes/db/database.dart';
import 'package:diabetes/helper/widget/center_loading.dart';
import 'package:diabetes/helper/widget/fixed_header.dart';
import 'package:diabetes/home/home_controller.dart';
import 'package:diabetes/home/rowitem.dart';
import 'package:diabetes/modal/reader_type.dart';
import 'package:diabetes/modal/with_avg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

class HomePage extends ConsumerWidget {
  static const routeName = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cont =  ref.watch(homeContProvider);
    final state = cont.state;
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: const Icon(Icons.add),
      // ),
      body: state.map<Widget>(
          init: (_) => const CenterLoading(),
          loading: (_) => const CenterLoading(),
          loaded: (loaded) {
            final data = loaded.data;
            final length = data.data.length;
            // final reversed = data.data.reversed;
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: buildAvgMainCard(data)),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: SliverFiexdHeaderDelegate(
                      child: buildFixedTitleCard(ref,!cont.isLastEmpty ), height: 50),
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate((context, i) {
                  final e = data.data.elementAt(length - i - 1);
                  return buildItem(ref, data, e);
                }, childCount: length)),
              ],
            );
          }),
    );
  }

  buildItem(
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
            title: 'قبل',
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
            title: 'بعد',
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
                      const Text('معدل : '),
                      Text(e.avg.toStringAsFixed(3)),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('تاريخ : '),
                      Text(DateFormat('dd / MM EEEE', 'ar').format((date)))
                    ],
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }

  Card buildFixedTitleCard(WidgetRef ref,bool enableAdd) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          if(enableAdd)  InkWell(
                onTap: () {
                  ref.read(homeContProvider.notifier).addNewRead();
                },
                child: const Icon(Icons.add)),
            const Text('فطور'),
            const Text('الغداء'),
            const Text('العشاء'),
            const Text('نوم')
          ].map((e) => Expanded(child: Center(child: e))).toList(),
        ),
      ),
    );
  }

  Card buildAvgMainCard(
      ResultWithAvg<List<CalcWithAvg<Map<ReaderType, ReadItemData>>>> data) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Flexible(
            child: Wrap(
              spacing: 10,
              children: [
                Text('معدل شهر كامل : ${data.monthAvg.avg.toStringAsFixed(3)}'),
                Text(
                    'معدل ثلاث اشهر  : ${data.monthAvg.avg.toStringAsFixed(3)}'),
                Text(
                    'معدل كل القراءات  : ${data.allAvg.avg.toStringAsFixed(3)}'),
              ],
            ),
          ),
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
