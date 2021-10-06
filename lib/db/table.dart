

import 'package:diabetes/modal/reader_type.dart';
import 'package:moor/moor.dart';

class ReadItem extends Table{
  DateTimeColumn get startDate => dateTime()();
  TextColumn get type => text().map(ReaderTypeConverter())();
  IntColumn get number => integer()();
}

