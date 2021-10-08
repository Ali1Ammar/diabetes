import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

showDeleteDialog(BuildContext context, VoidCallback onYes) => showDialog(
    context: context,
    builder: (context) => AlertDialog(
          content: Text(AppLocalizations.of(context)!.areyousuredelete),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(AppLocalizations.of(context)!.cancel)),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.red),
                onPressed: () {
                  Navigator.pop(context);

                  onYes();
                },
                child: Text(AppLocalizations.of(context)!.yesdelete))
          ],
        ));
