// ignore_for_file: avoid_print

import 'dart:io';
import 'dart:math';

import 'package:device_preview/device_preview.dart';
import 'package:diabetes/db/database.dart';
import 'package:diabetes/helper/widget/show_delete_dialog.dart';
import 'package:diabetes/home/home_controller.dart';
import 'package:diabetes/home/home_state.dart';
import 'package:diabetes/home/rowitem.dart';
import 'package:diabetes/modal/reader_type.dart';
import 'package:diabetes/modal/with_avg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:path/path.dart';

import 'package:screenshot_modes/screenshot_modes.dart';

import 'app.dart';

final screenshotWithModePlugin = SimpleScreenShot(
    processor: onScreen,
    pages: listPush,
    onEnd: (context) {
      onEnd();
    },

    // useToggleDarkMode: false,
    devices: device);

final device = <DeviceIdentifier>[
  // Devices.android.samsungNote10Plus.identifier,
  // Devices.android.nexus9.identifier,
  Devices.ios.iPadPro129.identifier,
  Devices.ios.iPhone11ProMax.identifier,
  Devices.ios.iPhoneSE.identifier,
  Devices.ios.iPhone11.identifier,
];
final listPush = <ItemScreenMode>[
  const ItemScreenMode(function: pushMain, label: "main"),
  const ItemScreenMode(function: pushClear, label: "clear"),
  const ItemScreenMode(function: pushAddEdit, label: "addedit"),
];

BuildContext get currentContext => navigatorKey.currentContext!;

Future pushMain(BuildContext context) async {
  Navigator.of(currentContext).popUntil((route) => route.isFirst);
  final homeCont =
      ProviderScope.containerOf(currentContext).read(homeContProvider.notifier);
  final loaded = (homeCont.state as HomeLoaded);
  final data = loaded.data;
  final listOfMap = data.data;
  for (var i = 0; i < 4; i++) {
    final newData = CalcWithAvg<Map<ReaderType, ReadItemData>>({});
    final date = DateTime.now().add(Duration(days: i));

    for (var i = 0; i < 7; i++) {
      final newType = ReaderType.values[i];
      var readItemData = ReadItemData(
          startDate: date, type: newType, number: Random().nextInt(300));
      newData.data[newType] = readItemData;
      newData.add(readItemData.number);
    }
    listOfMap.add(newData);
  }
  homeCont.state = loaded.copyWith(data: data);
  // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
  homeCont.notifyListeners();
  await waitMe;
}

Future pushClear(BuildContext context) async {
  Navigator.of(currentContext).popUntil((route) => route.isFirst);

  showDeleteDialog(currentContext, () {});
  await waitMe;
}

Future pushAddEdit(BuildContext context) async {
  Navigator.of(currentContext).popUntil((route) => route.isFirst);

  showDialog(
      context: currentContext,
      builder: (_) => AddToDialog(
            number: 90,
            type: ReaderType.afterBreakfast,
            onDone: (numb) {},
          ));
  await waitMe;
}

const folderName = 'screenshotnew';

Future<String> onScreen(DeviceScreenshotWithLabel screen) async {
  final name = screen.label.join("/");
  final path = join(Directory.current.path, folderName, '$name.png');
  final imageFile = File(path);
  await imageFile.create(recursive: true);
  await imageFile.writeAsBytes(screen.deviceScreenshot.bytes);
  return '$path saved';
}

Future<void> onEnd() async {
  // await resize("./screenshotnew/samsung-note10plus",
  //     './screenshotnew/playstore/scale', '1242x2208');
  // await resize(
  //     "./screenshotnew/nexus9", './screenshotnew/playstore/7', '2048x2732!');

  // iphone
  await resize("./screenshotnew/iphone-11promax",
      './screenshotnew/appstore/6.5', '1242x2688!');

  await resize("./screenshotnew/iphone-se", './screenshotnew/appstore/5.5',
      '1242x2208!');

  await resize("./screenshotnew/iphone-11", './screenshotnew/appstore/5.5new',
      '1242x2208!');

  await resize("./screenshotnew/ipad-pro12-9", './screenshotnew/appstore/12.9',
      '2048x2732!');

  print("end resizeing");
}

Future<void> resize(String inputFolder, String outputFolder, String size,
    [bool jpg = true]) async {
  Directory(outputFolder).createSync(recursive: true);
  await Process.run("mogrify", [
    "-path",
    outputFolder,
    "-resize",
    size,
    if (jpg) ...["-format", "jpg"],
    "$inputFolder/*.png"
  ]);
}

Future<void> get waitMe => Future.delayed(const Duration(milliseconds: 500));
