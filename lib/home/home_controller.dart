import 'package:diabetes/db/database.dart';
import 'package:diabetes/home/home_state.dart';
import 'package:diabetes/modal/reader_type.dart';
import 'package:diabetes/modal/with_avg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

final homeContProvider = ChangeNotifierProvider<HomeController>(
    (ref) => HomeController(ref.read)..getData());

class HomeController extends ChangeNotifier {
  final Reader read;
  late HomeState state;
  HomeController(this.read) {
    state = const HomeState.loading();
  }

  void getData() async {
    final data = await read(dbProvider).getAll();
    state = HomeState.loaded(data);
    notifyListeners();
  }

  void addNewRead() async {
    if (state is HomeLoaded) {
      final loaded = state as HomeLoaded;
      loaded.data.data.add(CalcWithAvg({}));
      notifyListeners();
    }
  }

  bool get isLastEmpty => (state as HomeLoaded).data.data.lastOrNull?.data.isEmpty ??false;

  void addItemToRead(DateTime? readId, int numb, ReaderType type,
      bool isEditItem, Map<ReaderType, ReadItemData> allItems) async {
    if (isEditItem) {
      read(dbProvider).updateRead(readId!, type, numb);
    } else {
      readId ??= DateTime.now();
      final newI =
          ReadItemCompanion.insert(number: numb, type: type, startDate: readId);
      read(dbProvider).addRead(newI);
    }
    final newItem = ReadItemData(number: numb, type: type, startDate: readId);
    allItems[type] = newItem;
    notifyListeners();
  }
}
