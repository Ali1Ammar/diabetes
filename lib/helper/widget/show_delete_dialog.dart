import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

showDeleteDialog(BuildContext context, VoidCallback onYes) => showDialog(
    context: context,
    builder: (context) => AlertDialog(
          content: const Text('هل انت متاكد من حذف جميع البيانات'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('الغاء')),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.red),
                onPressed: () {
                  Navigator.pop(context);

                  onYes();
                },
                child: const Text('نعم احذف'))
          ],
        ));
