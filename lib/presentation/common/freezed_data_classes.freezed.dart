// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'freezed_data_classes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GetMoviesObject {
  int get page => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  bool get isHasMoreMovies => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetMoviesObjectCopyWith<GetMoviesObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetMoviesObjectCopyWith<$Res> {
  factory $GetMoviesObjectCopyWith(
          GetMoviesObject value, $Res Function(GetMoviesObject) then) =
      _$GetMoviesObjectCopyWithImpl<$Res>;
  $Res call({int page, String type, bool isHasMoreMovies});
}

/// @nodoc
class _$GetMoviesObjectCopyWithImpl<$Res>
    implements $GetMoviesObjectCopyWith<$Res> {
  _$GetMoviesObjectCopyWithImpl(this._value, this._then);

  final GetMoviesObject _value;
  // ignore: unused_field
  final $Res Function(GetMoviesObject) _then;

  @override
  $Res call({
    Object? page = freezed,
    Object? type = freezed,
    Object? isHasMoreMovies = freezed,
  }) {
    return _then(_value.copyWith(
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      isHasMoreMovies: isHasMoreMovies == freezed
          ? _value.isHasMoreMovies
          : isHasMoreMovies // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_GetMoviesObjectCopyWith<$Res>
    implements $GetMoviesObjectCopyWith<$Res> {
  factory _$$_GetMoviesObjectCopyWith(
          _$_GetMoviesObject value, $Res Function(_$_GetMoviesObject) then) =
      __$$_GetMoviesObjectCopyWithImpl<$Res>;
  @override
  $Res call({int page, String type, bool isHasMoreMovies});
}

/// @nodoc
class __$$_GetMoviesObjectCopyWithImpl<$Res>
    extends _$GetMoviesObjectCopyWithImpl<$Res>
    implements _$$_GetMoviesObjectCopyWith<$Res> {
  __$$_GetMoviesObjectCopyWithImpl(
      _$_GetMoviesObject _value, $Res Function(_$_GetMoviesObject) _then)
      : super(_value, (v) => _then(v as _$_GetMoviesObject));

  @override
  _$_GetMoviesObject get _value => super._value as _$_GetMoviesObject;

  @override
  $Res call({
    Object? page = freezed,
    Object? type = freezed,
    Object? isHasMoreMovies = freezed,
  }) {
    return _then(_$_GetMoviesObject(
      page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      isHasMoreMovies == freezed
          ? _value.isHasMoreMovies
          : isHasMoreMovies // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_GetMoviesObject implements _GetMoviesObject {
  _$_GetMoviesObject(this.page, this.type, this.isHasMoreMovies);

  @override
  final int page;
  @override
  final String type;
  @override
  final bool isHasMoreMovies;

  @override
  String toString() {
    return 'GetMoviesObject(page: $page, type: $type, isHasMoreMovies: $isHasMoreMovies)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetMoviesObject &&
            const DeepCollectionEquality().equals(other.page, page) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality()
                .equals(other.isHasMoreMovies, isHasMoreMovies));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(page),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(isHasMoreMovies));

  @JsonKey(ignore: true)
  @override
  _$$_GetMoviesObjectCopyWith<_$_GetMoviesObject> get copyWith =>
      __$$_GetMoviesObjectCopyWithImpl<_$_GetMoviesObject>(this, _$identity);
}

abstract class _GetMoviesObject implements GetMoviesObject {
  factory _GetMoviesObject(
          final int page, final String type, final bool isHasMoreMovies) =
      _$_GetMoviesObject;

  @override
  int get page;
  @override
  String get type;
  @override
  bool get isHasMoreMovies;
  @override
  @JsonKey(ignore: true)
  _$$_GetMoviesObjectCopyWith<_$_GetMoviesObject> get copyWith =>
      throw _privateConstructorUsedError;
}
