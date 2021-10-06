// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class ReadItemData extends DataClass implements Insertable<ReadItemData> {
  final DateTime startDate;
  final ReaderType type;
  final int number;
  ReadItemData(
      {required this.startDate, required this.type, required this.number});
  factory ReadItemData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ReadItemData(
      startDate: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}start_date'])!,
      type: $ReadItemTable.$converter0.mapToDart(const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}type']))!,
      number: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}number'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['start_date'] = Variable<DateTime>(startDate);
    {
      final converter = $ReadItemTable.$converter0;
      map['type'] = Variable<String>(converter.mapToSql(type)!);
    }
    map['number'] = Variable<int>(number);
    return map;
  }

  ReadItemCompanion toCompanion(bool nullToAbsent) {
    return ReadItemCompanion(
      startDate: Value(startDate),
      type: Value(type),
      number: Value(number),
    );
  }

  factory ReadItemData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ReadItemData(
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      type: serializer.fromJson<ReaderType>(json['type']),
      number: serializer.fromJson<int>(json['number']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'startDate': serializer.toJson<DateTime>(startDate),
      'type': serializer.toJson<ReaderType>(type),
      'number': serializer.toJson<int>(number),
    };
  }

  ReadItemData copyWith({DateTime? startDate, ReaderType? type, int? number}) =>
      ReadItemData(
        startDate: startDate ?? this.startDate,
        type: type ?? this.type,
        number: number ?? this.number,
      );
  @override
  String toString() {
    return (StringBuffer('ReadItemData(')
          ..write('startDate: $startDate, ')
          ..write('type: $type, ')
          ..write('number: $number')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(startDate.hashCode, $mrjc(type.hashCode, number.hashCode)));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReadItemData &&
          other.startDate == this.startDate &&
          other.type == this.type &&
          other.number == this.number);
}

class ReadItemCompanion extends UpdateCompanion<ReadItemData> {
  final Value<DateTime> startDate;
  final Value<ReaderType> type;
  final Value<int> number;
  const ReadItemCompanion({
    this.startDate = const Value.absent(),
    this.type = const Value.absent(),
    this.number = const Value.absent(),
  });
  ReadItemCompanion.insert({
    required DateTime startDate,
    required ReaderType type,
    required int number,
  })  : startDate = Value(startDate),
        type = Value(type),
        number = Value(number);
  static Insertable<ReadItemData> custom({
    Expression<DateTime>? startDate,
    Expression<ReaderType>? type,
    Expression<int>? number,
  }) {
    return RawValuesInsertable({
      if (startDate != null) 'start_date': startDate,
      if (type != null) 'type': type,
      if (number != null) 'number': number,
    });
  }

  ReadItemCompanion copyWith(
      {Value<DateTime>? startDate,
      Value<ReaderType>? type,
      Value<int>? number}) {
    return ReadItemCompanion(
      startDate: startDate ?? this.startDate,
      type: type ?? this.type,
      number: number ?? this.number,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (type.present) {
      final converter = $ReadItemTable.$converter0;
      map['type'] = Variable<String>(converter.mapToSql(type.value)!);
    }
    if (number.present) {
      map['number'] = Variable<int>(number.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReadItemCompanion(')
          ..write('startDate: $startDate, ')
          ..write('type: $type, ')
          ..write('number: $number')
          ..write(')'))
        .toString();
  }
}

class $ReadItemTable extends ReadItem
    with TableInfo<$ReadItemTable, ReadItemData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ReadItemTable(this._db, [this._alias]);
  final VerificationMeta _startDateMeta = const VerificationMeta('startDate');
  late final GeneratedColumn<DateTime?> startDate = GeneratedColumn<DateTime?>(
      'start_date', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _typeMeta = const VerificationMeta('type');
  late final GeneratedColumnWithTypeConverter<ReaderType, String?> type =
      GeneratedColumn<String?>('type', aliasedName, false,
              typeName: 'TEXT', requiredDuringInsert: true)
          .withConverter<ReaderType>($ReadItemTable.$converter0);
  final VerificationMeta _numberMeta = const VerificationMeta('number');
  late final GeneratedColumn<int?> number = GeneratedColumn<int?>(
      'number', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [startDate, type, number];
  @override
  String get aliasedName => _alias ?? 'read_item';
  @override
  String get actualTableName => 'read_item';
  @override
  VerificationContext validateIntegrity(Insertable<ReadItemData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta));
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    context.handle(_typeMeta, const VerificationResult.success());
    if (data.containsKey('number')) {
      context.handle(_numberMeta,
          number.isAcceptableOrUnknown(data['number']!, _numberMeta));
    } else if (isInserting) {
      context.missing(_numberMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  ReadItemData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ReadItemData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ReadItemTable createAlias(String alias) {
    return $ReadItemTable(_db, alias);
  }

  static TypeConverter<ReaderType, String> $converter0 = ReaderTypeConverter();
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $ReadItemTable readItem = $ReadItemTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [readItem];
}
