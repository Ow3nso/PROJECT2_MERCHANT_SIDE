// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mpesa_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MpesaModel _$MpesaModelFromJson(Map<String, dynamic> json) {
  return _MpesaModel.fromJson(json);
}

/// @nodoc
mixin _$MpesaModel {
  @JsonKey(name: MpesaFields.status)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: MpesaFields.message)
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: MpesaFields.data)
  MpesaData? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MpesaModelCopyWith<MpesaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MpesaModelCopyWith<$Res> {
  factory $MpesaModelCopyWith(
          MpesaModel value, $Res Function(MpesaModel) then) =
      _$MpesaModelCopyWithImpl<$Res, MpesaModel>;
  @useResult
  $Res call(
      {@JsonKey(name: MpesaFields.status) String? status,
      @JsonKey(name: MpesaFields.message) String? message,
      @JsonKey(name: MpesaFields.data) MpesaData? data});

  $MpesaDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$MpesaModelCopyWithImpl<$Res, $Val extends MpesaModel>
    implements $MpesaModelCopyWith<$Res> {
  _$MpesaModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as MpesaData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MpesaDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $MpesaDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MpesaModelImplCopyWith<$Res>
    implements $MpesaModelCopyWith<$Res> {
  factory _$$MpesaModelImplCopyWith(
          _$MpesaModelImpl value, $Res Function(_$MpesaModelImpl) then) =
      __$$MpesaModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: MpesaFields.status) String? status,
      @JsonKey(name: MpesaFields.message) String? message,
      @JsonKey(name: MpesaFields.data) MpesaData? data});

  @override
  $MpesaDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$MpesaModelImplCopyWithImpl<$Res>
    extends _$MpesaModelCopyWithImpl<$Res, _$MpesaModelImpl>
    implements _$$MpesaModelImplCopyWith<$Res> {
  __$$MpesaModelImplCopyWithImpl(
      _$MpesaModelImpl _value, $Res Function(_$MpesaModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$MpesaModelImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as MpesaData?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$MpesaModelImpl implements _MpesaModel {
  _$MpesaModelImpl(
      {@JsonKey(name: MpesaFields.status) this.status,
      @JsonKey(name: MpesaFields.message) this.message,
      @JsonKey(name: MpesaFields.data) this.data});

  factory _$MpesaModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MpesaModelImplFromJson(json);

  @override
  @JsonKey(name: MpesaFields.status)
  final String? status;
  @override
  @JsonKey(name: MpesaFields.message)
  final String? message;
  @override
  @JsonKey(name: MpesaFields.data)
  final MpesaData? data;

  @override
  String toString() {
    return 'MpesaModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MpesaModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MpesaModelImplCopyWith<_$MpesaModelImpl> get copyWith =>
      __$$MpesaModelImplCopyWithImpl<_$MpesaModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MpesaModelImplToJson(
      this,
    );
  }
}

abstract class _MpesaModel implements MpesaModel {
  factory _MpesaModel(
          {@JsonKey(name: MpesaFields.status) final String? status,
          @JsonKey(name: MpesaFields.message) final String? message,
          @JsonKey(name: MpesaFields.data) final MpesaData? data}) =
      _$MpesaModelImpl;

  factory _MpesaModel.fromJson(Map<String, dynamic> json) =
      _$MpesaModelImpl.fromJson;

  @override
  @JsonKey(name: MpesaFields.status)
  String? get status;
  @override
  @JsonKey(name: MpesaFields.message)
  String? get message;
  @override
  @JsonKey(name: MpesaFields.data)
  MpesaData? get data;
  @override
  @JsonKey(ignore: true)
  _$$MpesaModelImplCopyWith<_$MpesaModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
