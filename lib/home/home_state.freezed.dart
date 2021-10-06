// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HomeStateTearOff {
  const _$HomeStateTearOff();

  HomeInit init() {
    return const HomeInit();
  }

  HomeLoading loading() {
    return const HomeLoading();
  }

  HomeLoaded loaded(
      ResultWithAvg<List<CalcWithAvg<Map<ReaderType, ReadItemData>>>> data) {
    return HomeLoaded(
      data,
    );
  }
}

/// @nodoc
const $HomeState = _$HomeStateTearOff();

/// @nodoc
mixin _$HomeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(
            ResultWithAvg<List<CalcWithAvg<Map<ReaderType, ReadItemData>>>>
                data)
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(
            ResultWithAvg<List<CalcWithAvg<Map<ReaderType, ReadItemData>>>>
                data)?
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(
            ResultWithAvg<List<CalcWithAvg<Map<ReaderType, ReadItemData>>>>
                data)?
        loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeInit value) init,
    required TResult Function(HomeLoading value) loading,
    required TResult Function(HomeLoaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HomeInit value)? init,
    TResult Function(HomeLoading value)? loading,
    TResult Function(HomeLoaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeInit value)? init,
    TResult Function(HomeLoading value)? loading,
    TResult Function(HomeLoaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  final HomeState _value;
  // ignore: unused_field
  final $Res Function(HomeState) _then;
}

/// @nodoc
abstract class $HomeInitCopyWith<$Res> {
  factory $HomeInitCopyWith(HomeInit value, $Res Function(HomeInit) then) =
      _$HomeInitCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomeInitCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements $HomeInitCopyWith<$Res> {
  _$HomeInitCopyWithImpl(HomeInit _value, $Res Function(HomeInit) _then)
      : super(_value, (v) => _then(v as HomeInit));

  @override
  HomeInit get _value => super._value as HomeInit;
}

/// @nodoc

class _$HomeInit implements HomeInit {
  const _$HomeInit();

  @override
  String toString() {
    return 'HomeState.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is HomeInit);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(
            ResultWithAvg<List<CalcWithAvg<Map<ReaderType, ReadItemData>>>>
                data)
        loaded,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(
            ResultWithAvg<List<CalcWithAvg<Map<ReaderType, ReadItemData>>>>
                data)?
        loaded,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(
            ResultWithAvg<List<CalcWithAvg<Map<ReaderType, ReadItemData>>>>
                data)?
        loaded,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeInit value) init,
    required TResult Function(HomeLoading value) loading,
    required TResult Function(HomeLoaded value) loaded,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HomeInit value)? init,
    TResult Function(HomeLoading value)? loading,
    TResult Function(HomeLoaded value)? loaded,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeInit value)? init,
    TResult Function(HomeLoading value)? loading,
    TResult Function(HomeLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class HomeInit implements HomeState {
  const factory HomeInit() = _$HomeInit;
}

/// @nodoc
abstract class $HomeLoadingCopyWith<$Res> {
  factory $HomeLoadingCopyWith(
          HomeLoading value, $Res Function(HomeLoading) then) =
      _$HomeLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomeLoadingCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements $HomeLoadingCopyWith<$Res> {
  _$HomeLoadingCopyWithImpl(
      HomeLoading _value, $Res Function(HomeLoading) _then)
      : super(_value, (v) => _then(v as HomeLoading));

  @override
  HomeLoading get _value => super._value as HomeLoading;
}

/// @nodoc

class _$HomeLoading implements HomeLoading {
  const _$HomeLoading();

  @override
  String toString() {
    return 'HomeState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is HomeLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(
            ResultWithAvg<List<CalcWithAvg<Map<ReaderType, ReadItemData>>>>
                data)
        loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(
            ResultWithAvg<List<CalcWithAvg<Map<ReaderType, ReadItemData>>>>
                data)?
        loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(
            ResultWithAvg<List<CalcWithAvg<Map<ReaderType, ReadItemData>>>>
                data)?
        loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeInit value) init,
    required TResult Function(HomeLoading value) loading,
    required TResult Function(HomeLoaded value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HomeInit value)? init,
    TResult Function(HomeLoading value)? loading,
    TResult Function(HomeLoaded value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeInit value)? init,
    TResult Function(HomeLoading value)? loading,
    TResult Function(HomeLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class HomeLoading implements HomeState {
  const factory HomeLoading() = _$HomeLoading;
}

/// @nodoc
abstract class $HomeLoadedCopyWith<$Res> {
  factory $HomeLoadedCopyWith(
          HomeLoaded value, $Res Function(HomeLoaded) then) =
      _$HomeLoadedCopyWithImpl<$Res>;
  $Res call(
      {ResultWithAvg<List<CalcWithAvg<Map<ReaderType, ReadItemData>>>> data});
}

/// @nodoc
class _$HomeLoadedCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements $HomeLoadedCopyWith<$Res> {
  _$HomeLoadedCopyWithImpl(HomeLoaded _value, $Res Function(HomeLoaded) _then)
      : super(_value, (v) => _then(v as HomeLoaded));

  @override
  HomeLoaded get _value => super._value as HomeLoaded;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(HomeLoaded(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ResultWithAvg<
                  List<CalcWithAvg<Map<ReaderType, ReadItemData>>>>,
    ));
  }
}

/// @nodoc

class _$HomeLoaded implements HomeLoaded {
  const _$HomeLoaded(this.data);

  @override
  final ResultWithAvg<List<CalcWithAvg<Map<ReaderType, ReadItemData>>>> data;

  @override
  String toString() {
    return 'HomeState.loaded(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is HomeLoaded &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  $HomeLoadedCopyWith<HomeLoaded> get copyWith =>
      _$HomeLoadedCopyWithImpl<HomeLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(
            ResultWithAvg<List<CalcWithAvg<Map<ReaderType, ReadItemData>>>>
                data)
        loaded,
  }) {
    return loaded(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(
            ResultWithAvg<List<CalcWithAvg<Map<ReaderType, ReadItemData>>>>
                data)?
        loaded,
  }) {
    return loaded?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(
            ResultWithAvg<List<CalcWithAvg<Map<ReaderType, ReadItemData>>>>
                data)?
        loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeInit value) init,
    required TResult Function(HomeLoading value) loading,
    required TResult Function(HomeLoaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HomeInit value)? init,
    TResult Function(HomeLoading value)? loading,
    TResult Function(HomeLoaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeInit value)? init,
    TResult Function(HomeLoading value)? loading,
    TResult Function(HomeLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class HomeLoaded implements HomeState {
  const factory HomeLoaded(
      ResultWithAvg<List<CalcWithAvg<Map<ReaderType, ReadItemData>>>>
          data) = _$HomeLoaded;

  ResultWithAvg<List<CalcWithAvg<Map<ReaderType, ReadItemData>>>> get data =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomeLoadedCopyWith<HomeLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
