// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InvoiceModel _$InvoiceModelFromJson(Map<String, dynamic> json) {
  return _InvoiceModel.fromJson(json);
}

/// @nodoc
mixin _$InvoiceModel {
  @JsonKey(name: MpesaFields.id)
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: MpesaFields.shopId)
  String? get shopId => throw _privateConstructorUsedError;
  @JsonKey(name: MpesaFields.orderId)
  String? get orderId => throw _privateConstructorUsedError;
  @JsonKey(name: MpesaFields.invoiceId)
  String? get invoiceId => throw _privateConstructorUsedError;
  @JsonKey(name: MpesaFields.state)
  String? get state => throw _privateConstructorUsedError;
  @JsonKey(
      name: MpesaFields.createdAt,
      fromJson: DateUtils.timestampToDateTime,
      toJson: DateUtils.dateTimeToTimestamp)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: MpesaFields.provider)
  String? get provider => throw _privateConstructorUsedError;
  @JsonKey(name: MpesaFields.netAmount, defaultValue: 0)
  double? get netAmount => throw _privateConstructorUsedError;
  @JsonKey(name: MpesaFields.amount, defaultValue: 0)
  double? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: MpesaFields.currency, defaultValue: 'KES')
  String? get currency => throw _privateConstructorUsedError;
  @JsonKey(name: MpesaFields.mpesaReference)
  String? get mpesaReference => throw _privateConstructorUsedError;
  @JsonKey(name: MpesaFields.failedCode)
  String? get failedCode => throw _privateConstructorUsedError;
  @JsonKey(name: MpesaFields.failedReason)
  String? get failedReason => throw _privateConstructorUsedError;
  @JsonKey(name: MpesaFields.updatedAt)
  int? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvoiceModelCopyWith<InvoiceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceModelCopyWith<$Res> {
  factory $InvoiceModelCopyWith(
          InvoiceModel value, $Res Function(InvoiceModel) then) =
      _$InvoiceModelCopyWithImpl<$Res, InvoiceModel>;
  @useResult
  $Res call(
      {@JsonKey(name: MpesaFields.id) String? id,
      @JsonKey(name: MpesaFields.shopId) String? shopId,
      @JsonKey(name: MpesaFields.orderId) String? orderId,
      @JsonKey(name: MpesaFields.invoiceId) String? invoiceId,
      @JsonKey(name: MpesaFields.state) String? state,
      @JsonKey(
          name: MpesaFields.createdAt,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
      DateTime? createdAt,
      @JsonKey(name: MpesaFields.provider) String? provider,
      @JsonKey(name: MpesaFields.netAmount, defaultValue: 0) double? netAmount,
      @JsonKey(name: MpesaFields.amount, defaultValue: 0) double? amount,
      @JsonKey(name: MpesaFields.currency, defaultValue: 'KES')
      String? currency,
      @JsonKey(name: MpesaFields.mpesaReference) String? mpesaReference,
      @JsonKey(name: MpesaFields.failedCode) String? failedCode,
      @JsonKey(name: MpesaFields.failedReason) String? failedReason,
      @JsonKey(name: MpesaFields.updatedAt) int? updatedAt});
}

/// @nodoc
class _$InvoiceModelCopyWithImpl<$Res, $Val extends InvoiceModel>
    implements $InvoiceModelCopyWith<$Res> {
  _$InvoiceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? shopId = freezed,
    Object? orderId = freezed,
    Object? invoiceId = freezed,
    Object? state = freezed,
    Object? createdAt = freezed,
    Object? provider = freezed,
    Object? netAmount = freezed,
    Object? amount = freezed,
    Object? currency = freezed,
    Object? mpesaReference = freezed,
    Object? failedCode = freezed,
    Object? failedReason = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      shopId: freezed == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as String?,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      invoiceId: freezed == invoiceId
          ? _value.invoiceId
          : invoiceId // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String?,
      netAmount: freezed == netAmount
          ? _value.netAmount
          : netAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      mpesaReference: freezed == mpesaReference
          ? _value.mpesaReference
          : mpesaReference // ignore: cast_nullable_to_non_nullable
              as String?,
      failedCode: freezed == failedCode
          ? _value.failedCode
          : failedCode // ignore: cast_nullable_to_non_nullable
              as String?,
      failedReason: freezed == failedReason
          ? _value.failedReason
          : failedReason // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InvoiceModelImplCopyWith<$Res>
    implements $InvoiceModelCopyWith<$Res> {
  factory _$$InvoiceModelImplCopyWith(
          _$InvoiceModelImpl value, $Res Function(_$InvoiceModelImpl) then) =
      __$$InvoiceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: MpesaFields.id) String? id,
      @JsonKey(name: MpesaFields.shopId) String? shopId,
      @JsonKey(name: MpesaFields.orderId) String? orderId,
      @JsonKey(name: MpesaFields.invoiceId) String? invoiceId,
      @JsonKey(name: MpesaFields.state) String? state,
      @JsonKey(
          name: MpesaFields.createdAt,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
      DateTime? createdAt,
      @JsonKey(name: MpesaFields.provider) String? provider,
      @JsonKey(name: MpesaFields.netAmount, defaultValue: 0) double? netAmount,
      @JsonKey(name: MpesaFields.amount, defaultValue: 0) double? amount,
      @JsonKey(name: MpesaFields.currency, defaultValue: 'KES')
      String? currency,
      @JsonKey(name: MpesaFields.mpesaReference) String? mpesaReference,
      @JsonKey(name: MpesaFields.failedCode) String? failedCode,
      @JsonKey(name: MpesaFields.failedReason) String? failedReason,
      @JsonKey(name: MpesaFields.updatedAt) int? updatedAt});
}

/// @nodoc
class __$$InvoiceModelImplCopyWithImpl<$Res>
    extends _$InvoiceModelCopyWithImpl<$Res, _$InvoiceModelImpl>
    implements _$$InvoiceModelImplCopyWith<$Res> {
  __$$InvoiceModelImplCopyWithImpl(
      _$InvoiceModelImpl _value, $Res Function(_$InvoiceModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? shopId = freezed,
    Object? orderId = freezed,
    Object? invoiceId = freezed,
    Object? state = freezed,
    Object? createdAt = freezed,
    Object? provider = freezed,
    Object? netAmount = freezed,
    Object? amount = freezed,
    Object? currency = freezed,
    Object? mpesaReference = freezed,
    Object? failedCode = freezed,
    Object? failedReason = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$InvoiceModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      shopId: freezed == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as String?,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      invoiceId: freezed == invoiceId
          ? _value.invoiceId
          : invoiceId // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String?,
      netAmount: freezed == netAmount
          ? _value.netAmount
          : netAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      mpesaReference: freezed == mpesaReference
          ? _value.mpesaReference
          : mpesaReference // ignore: cast_nullable_to_non_nullable
              as String?,
      failedCode: freezed == failedCode
          ? _value.failedCode
          : failedCode // ignore: cast_nullable_to_non_nullable
              as String?,
      failedReason: freezed == failedReason
          ? _value.failedReason
          : failedReason // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$InvoiceModelImpl implements _InvoiceModel {
  _$InvoiceModelImpl(
      {@JsonKey(name: MpesaFields.id) this.id,
      @JsonKey(name: MpesaFields.shopId) this.shopId,
      @JsonKey(name: MpesaFields.orderId) this.orderId,
      @JsonKey(name: MpesaFields.invoiceId) this.invoiceId,
      @JsonKey(name: MpesaFields.state) this.state,
      @JsonKey(
          name: MpesaFields.createdAt,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
      this.createdAt,
      @JsonKey(name: MpesaFields.provider) this.provider,
      @JsonKey(name: MpesaFields.netAmount, defaultValue: 0) this.netAmount,
      @JsonKey(name: MpesaFields.amount, defaultValue: 0) this.amount,
      @JsonKey(name: MpesaFields.currency, defaultValue: 'KES') this.currency,
      @JsonKey(name: MpesaFields.mpesaReference) this.mpesaReference,
      @JsonKey(name: MpesaFields.failedCode) this.failedCode,
      @JsonKey(name: MpesaFields.failedReason) this.failedReason,
      @JsonKey(name: MpesaFields.updatedAt) this.updatedAt});

  factory _$InvoiceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvoiceModelImplFromJson(json);

  @override
  @JsonKey(name: MpesaFields.id)
  final String? id;
  @override
  @JsonKey(name: MpesaFields.shopId)
  final String? shopId;
  @override
  @JsonKey(name: MpesaFields.orderId)
  final String? orderId;
  @override
  @JsonKey(name: MpesaFields.invoiceId)
  final String? invoiceId;
  @override
  @JsonKey(name: MpesaFields.state)
  final String? state;
  @override
  @JsonKey(
      name: MpesaFields.createdAt,
      fromJson: DateUtils.timestampToDateTime,
      toJson: DateUtils.dateTimeToTimestamp)
  final DateTime? createdAt;
  @override
  @JsonKey(name: MpesaFields.provider)
  final String? provider;
  @override
  @JsonKey(name: MpesaFields.netAmount, defaultValue: 0)
  final double? netAmount;
  @override
  @JsonKey(name: MpesaFields.amount, defaultValue: 0)
  final double? amount;
  @override
  @JsonKey(name: MpesaFields.currency, defaultValue: 'KES')
  final String? currency;
  @override
  @JsonKey(name: MpesaFields.mpesaReference)
  final String? mpesaReference;
  @override
  @JsonKey(name: MpesaFields.failedCode)
  final String? failedCode;
  @override
  @JsonKey(name: MpesaFields.failedReason)
  final String? failedReason;
  @override
  @JsonKey(name: MpesaFields.updatedAt)
  final int? updatedAt;

  @override
  String toString() {
    return 'InvoiceModel(id: $id, shopId: $shopId, orderId: $orderId, invoiceId: $invoiceId, state: $state, createdAt: $createdAt, provider: $provider, netAmount: $netAmount, amount: $amount, currency: $currency, mpesaReference: $mpesaReference, failedCode: $failedCode, failedReason: $failedReason, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvoiceModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.shopId, shopId) || other.shopId == shopId) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.invoiceId, invoiceId) ||
                other.invoiceId == invoiceId) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.netAmount, netAmount) ||
                other.netAmount == netAmount) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.mpesaReference, mpesaReference) ||
                other.mpesaReference == mpesaReference) &&
            (identical(other.failedCode, failedCode) ||
                other.failedCode == failedCode) &&
            (identical(other.failedReason, failedReason) ||
                other.failedReason == failedReason) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      shopId,
      orderId,
      invoiceId,
      state,
      createdAt,
      provider,
      netAmount,
      amount,
      currency,
      mpesaReference,
      failedCode,
      failedReason,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvoiceModelImplCopyWith<_$InvoiceModelImpl> get copyWith =>
      __$$InvoiceModelImplCopyWithImpl<_$InvoiceModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvoiceModelImplToJson(
      this,
    );
  }
}

abstract class _InvoiceModel implements InvoiceModel {
  factory _InvoiceModel(
      {@JsonKey(name: MpesaFields.id) final String? id,
      @JsonKey(name: MpesaFields.shopId) final String? shopId,
      @JsonKey(name: MpesaFields.orderId) final String? orderId,
      @JsonKey(name: MpesaFields.invoiceId) final String? invoiceId,
      @JsonKey(name: MpesaFields.state) final String? state,
      @JsonKey(
          name: MpesaFields.createdAt,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
      final DateTime? createdAt,
      @JsonKey(name: MpesaFields.provider) final String? provider,
      @JsonKey(name: MpesaFields.netAmount, defaultValue: 0)
      final double? netAmount,
      @JsonKey(name: MpesaFields.amount, defaultValue: 0) final double? amount,
      @JsonKey(name: MpesaFields.currency, defaultValue: 'KES')
      final String? currency,
      @JsonKey(name: MpesaFields.mpesaReference) final String? mpesaReference,
      @JsonKey(name: MpesaFields.failedCode) final String? failedCode,
      @JsonKey(name: MpesaFields.failedReason) final String? failedReason,
      @JsonKey(name: MpesaFields.updatedAt)
      final int? updatedAt}) = _$InvoiceModelImpl;

  factory _InvoiceModel.fromJson(Map<String, dynamic> json) =
      _$InvoiceModelImpl.fromJson;

  @override
  @JsonKey(name: MpesaFields.id)
  String? get id;
  @override
  @JsonKey(name: MpesaFields.shopId)
  String? get shopId;
  @override
  @JsonKey(name: MpesaFields.orderId)
  String? get orderId;
  @override
  @JsonKey(name: MpesaFields.invoiceId)
  String? get invoiceId;
  @override
  @JsonKey(name: MpesaFields.state)
  String? get state;
  @override
  @JsonKey(
      name: MpesaFields.createdAt,
      fromJson: DateUtils.timestampToDateTime,
      toJson: DateUtils.dateTimeToTimestamp)
  DateTime? get createdAt;
  @override
  @JsonKey(name: MpesaFields.provider)
  String? get provider;
  @override
  @JsonKey(name: MpesaFields.netAmount, defaultValue: 0)
  double? get netAmount;
  @override
  @JsonKey(name: MpesaFields.amount, defaultValue: 0)
  double? get amount;
  @override
  @JsonKey(name: MpesaFields.currency, defaultValue: 'KES')
  String? get currency;
  @override
  @JsonKey(name: MpesaFields.mpesaReference)
  String? get mpesaReference;
  @override
  @JsonKey(name: MpesaFields.failedCode)
  String? get failedCode;
  @override
  @JsonKey(name: MpesaFields.failedReason)
  String? get failedReason;
  @override
  @JsonKey(name: MpesaFields.updatedAt)
  int? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$InvoiceModelImplCopyWith<_$InvoiceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
