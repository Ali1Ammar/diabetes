import 'package:diabetes/modal/reader_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RowItem extends StatelessWidget {
  final int? number;
  final VoidCallback onChange;
  const RowItem({Key? key, required this.number, required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (number == null) {
      return IconButton(
        icon: const Icon(Icons.add),
        onPressed: onChange,
      );
    }
    return InkWell(onDoubleTap: onChange, child: Text(number!.toString()));
  }
}

class AddToDialog extends HookWidget {
  final int? number;
  final ReaderType type;
  final void Function(int) onDone;
  const AddToDialog(
      {Key? key,
      required this.number,
      required this.type,
      required this.onDone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cont = useTextEditingController(text: number?.toString());
    return AlertDialog(
      title: Text(
          '${AppLocalizations.of(context)!.enter} ${type.toRead(context)}'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: cont,
            keyboardType: TextInputType.number,
          )
        ],
      ),
      actions: [
        const BackButton(),
        TextButton.icon(
            onPressed: () {
              final numb = num.parse(cont.text);
              onDone(numb.toInt());
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.save),
            label:  Text( AppLocalizations.of(context)!.save  ))
      ],
    );
  }
}
