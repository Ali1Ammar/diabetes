import 'package:flutter/cupertino.dart';
import 'package:moor/moor.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
  String toRead(BuildContext context) {
    switch (this) {
      case ReaderType.beforeBreakfast:
        return AppLocalizations.of(context)!.beforeBreakfast;
      case ReaderType.afterBreakfast:
        return AppLocalizations.of(context)!.afterBreakfast;

      case ReaderType.beforeLunch:
        return AppLocalizations.of(context)!.beforeLunch;

      case ReaderType.afterLunch:
        return AppLocalizations.of(context)!.afterLunch;

      case ReaderType.beforeDinner:
        return AppLocalizations.of(context)!.beforeDinner;

      case ReaderType.afterDinner:
        return AppLocalizations.of(context)!.afterDinner;

      case ReaderType.beforeSleep:
        return AppLocalizations.of(context)!.beforeSleep;

      case ReaderType.empty:
        return "empty";
    }
  }
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

const typeToReadMap = {
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
