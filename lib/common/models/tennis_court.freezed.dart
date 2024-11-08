// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tennis_court.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TennisCourt _$TennisCourtFromJson(Map<String, dynamic> json) {
  return _TennisCourt.fromJson(json);
}

/// @nodoc
mixin _$TennisCourt {
  String get title => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;

  /// Serializes this TennisCourt to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TennisCourt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TennisCourtCopyWith<TennisCourt> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TennisCourtCopyWith<$Res> {
  factory $TennisCourtCopyWith(
          TennisCourt value, $Res Function(TennisCourt) then) =
      _$TennisCourtCopyWithImpl<$Res, TennisCourt>;
  @useResult
  $Res call({String title, String type, double price, String address});
}

/// @nodoc
class _$TennisCourtCopyWithImpl<$Res, $Val extends TennisCourt>
    implements $TennisCourtCopyWith<$Res> {
  _$TennisCourtCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TennisCourt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? type = null,
    Object? price = null,
    Object? address = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TennisCourtImplCopyWith<$Res>
    implements $TennisCourtCopyWith<$Res> {
  factory _$$TennisCourtImplCopyWith(
          _$TennisCourtImpl value, $Res Function(_$TennisCourtImpl) then) =
      __$$TennisCourtImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String type, double price, String address});
}

/// @nodoc
class __$$TennisCourtImplCopyWithImpl<$Res>
    extends _$TennisCourtCopyWithImpl<$Res, _$TennisCourtImpl>
    implements _$$TennisCourtImplCopyWith<$Res> {
  __$$TennisCourtImplCopyWithImpl(
      _$TennisCourtImpl _value, $Res Function(_$TennisCourtImpl) _then)
      : super(_value, _then);

  /// Create a copy of TennisCourt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? type = null,
    Object? price = null,
    Object? address = null,
  }) {
    return _then(_$TennisCourtImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TennisCourtImpl implements _TennisCourt {
  const _$TennisCourtImpl(
      {required this.title,
      required this.type,
      required this.price,
      required this.address});

  factory _$TennisCourtImpl.fromJson(Map<String, dynamic> json) =>
      _$$TennisCourtImplFromJson(json);

  @override
  final String title;
  @override
  final String type;
  @override
  final double price;
  @override
  final String address;

  @override
  String toString() {
    return 'TennisCourt(title: $title, type: $type, price: $price, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TennisCourtImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, type, price, address);

  /// Create a copy of TennisCourt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TennisCourtImplCopyWith<_$TennisCourtImpl> get copyWith =>
      __$$TennisCourtImplCopyWithImpl<_$TennisCourtImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TennisCourtImplToJson(
      this,
    );
  }
}

abstract class _TennisCourt implements TennisCourt {
  const factory _TennisCourt(
      {required final String title,
      required final String type,
      required final double price,
      required final String address}) = _$TennisCourtImpl;

  factory _TennisCourt.fromJson(Map<String, dynamic> json) =
      _$TennisCourtImpl.fromJson;

  @override
  String get title;
  @override
  String get type;
  @override
  double get price;
  @override
  String get address;

  /// Create a copy of TennisCourt
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TennisCourtImplCopyWith<_$TennisCourtImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
