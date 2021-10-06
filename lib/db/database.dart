import 'dart:io';

import 'package:diabetes/db/table.dart';
import 'package:diabetes/modal/reader_type.dart';
import 'package:diabetes/modal/with_avg.dart';
import 'package:moor/moor.dart';
// These imports are only needed to open the database
import 'package:moor/ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:riverpod/riverpod.dart';
part 'database.g.dart';

final dbProvider = Provider((_) => AppDb());

@UseMoor(tables: [ReadItem])
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // Future<List<ReadItemData>> getViaDateRange(DateTime min, DateTime max) async {
  //   return (select(readItem)..where((tbl) => tbl.date.isBetweenValues(min, max)))
  //       .get();
  // }

  Future<ResultWithAvg<List<CalcWithAvg<Map<ReaderType, ReadItemData>>>>>
      getAll() async {
    final data = await (select(readItem)
          ..orderBy([
            (tbl) => OrderingTerm(
                  expression: tbl.startDate,
                )
          ]))
        .get();
    final mapRes = <DateTime, CalcWithAvg<Map<ReaderType, ReadItemData>>>{};

    final avgForMonth = CalcAvg();
    final beforeMonth = DateTime.now().subtract(const Duration(days: 30));
    final avgForThreeMonth = CalcAvg();
    final beforeThreeMonth = DateTime.now().subtract(const Duration(days: 90));
    final avgAllMonth = CalcAvg();

    for (final item in data) {
      final map = mapRes.putIfAbsent(item.startDate, () => CalcWithAvg({}));
      map.data[item.type] = item;
      map.add(item.number);
      avgAllMonth.add(item.number);
      if (item.startDate.isAfter(beforeMonth)) {
        avgForMonth.add(item.number);
        avgForThreeMonth.add(item.number);
      } else if (item.startDate.isAfter(beforeThreeMonth)) {
        avgForThreeMonth.add(item.number);
      }
    }
    final sortedList = (mapRes.entries.toList()
          ..sort((f, s) => f.key.compareTo(s.key)))
        .map((val) => val.value)
        .toList();
    return ResultWithAvg(
        avgAllMonth, avgForMonth, avgForThreeMonth, sortedList);
  }

  Future<void> addRead(ReadItemCompanion data) async {
    await into(readItem).insert(data);
  }

  Future<void> updateRead(
      DateTime startDate, ReaderType type, int number) async {
    await (update(readItem)
          ..where((tbl) =>
              tbl.startDate.equals(startDate) & tbl.type.equals(type.toJson())))
        .write(ReadItemCompanion(number: Value(number)));
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}
