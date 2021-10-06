import 'package:moor/moor.dart';

enum ReaderType {
  beforeBreakfast,
  afterBreakfast,
  beforeLunch,
  afterLunch,
  beforeDinner,
  afterDinner,
  beforeSleep,
  empty
}

extension ReaderTypeConvertExt on ReaderType {
  String toJson() => typeToStringMap[this]!;
  String toArabic() => typeToArabicMap[this]!;
}

ReaderType genderTypeFromString(String type) => stringToTypeMap[type]!;

const stringToTypeMap = {
  "afterBreakfast": ReaderType.afterBreakfast,
  "afterDinner": ReaderType.afterDinner,
  "afterLunch": ReaderType.afterLunch,
  "beforeBreakfast": ReaderType.beforeBreakfast,
  "beforeDinner": ReaderType.beforeDinner,
  "beforeLunch": ReaderType.beforeLunch,
  "beforeSleep": ReaderType.beforeSleep,
};

const typeToStringMap = {
  ReaderType.afterBreakfast: "afterBreakfast",
  ReaderType.afterDinner: "afterDinner",
  ReaderType.afterLunch: "afterLunch",
  ReaderType.beforeBreakfast: "beforeBreakfast",
  ReaderType.beforeDinner: "beforeDinner",
  ReaderType.beforeLunch: "beforeLunch",
  ReaderType.beforeSleep: "beforeSleep",
};

const typeToArabicMap = {
  ReaderType.afterBreakfast: "بعد الفطور",
  ReaderType.afterDinner: "بعد الغداء",
  ReaderType.afterLunch: "بعد العشاء",
  ReaderType.beforeBreakfast: "قبل الفطور",
  ReaderType.beforeDinner: "قبل الغداء",
  ReaderType.beforeLunch: "قبل العشاء",
  ReaderType.beforeSleep: "قبل النوم",
};

class ReaderTypeConverter extends TypeConverter<ReaderType, String> {
  @override
  ReaderType? mapToDart(String? fromDb) => stringToTypeMap[fromDb];

  @override
  String? mapToSql(ReaderType? value) => typeToStringMap[value];
}
