
import 'package:diabetes/db/database.dart';
import 'package:diabetes/modal/reader_type.dart';
import 'package:diabetes/modal/with_avg.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';
@freezed
class HomeState with _$HomeState {
  const factory HomeState.init()= HomeInit;
  const factory HomeState.loading()= HomeLoading;
  const factory HomeState.loaded(ResultWithAvg<List<CalcWithAvg<Map<ReaderType, ReadItemData>>>> data)= HomeLoaded;

}