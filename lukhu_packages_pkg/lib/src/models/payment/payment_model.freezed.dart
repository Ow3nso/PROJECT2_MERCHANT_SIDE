// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentModel _$PaymentModelFromJson(Map<String, dynamic> json) {
  return _PaymentModel.fromJson(json);
}

/// @nodoc
mixin _$PaymentModel {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: PaymentFields.shopId)
  String? get shopId => throw _privateConstructorUsedError;
  @JsonKey(name: PaymentFields.userId)
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: PaymentFields.account)
  String? get account => throw _privateConstructorUsedError;
  @JsonKey(name: PaymentFields.type)
  AccountType? get type => throw _privateConstructorUsedError;
  @JsonKey(name: PaymentFields.name)
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: PaymentFields.isChecked)
  bool? get isChecked => throw _privateConstructorUsedError;
  @JsonKey(name: PaymentFields.expiryDate)
  String? get expiryDate => throw _privateConstructorUsedError;
  @JsonKey(
      name: PaymentFields.createdAt,
      fromJson: DateUtils.timestampToDateTime,
      toJson: DateUtils.dateTimeToTimestamp)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: PaymentFields.updatedAt)
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: PaymentFields.cvv)
  String? get cvv => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentModelCopyWith<PaymentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentModelCopyWith<$Res> {
  factory $PaymentModelCopyWith(
          PaymentModel value, $Res Function(PaymentModel) then) =
      _$PaymentModelCopyWithImpl<$Res, PaymentModel>;
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: PaymentFields.shopId) String? shopId,
      @JsonKey(name: PaymentFields.userId) String? userId,
      @JsonKey(name: PaymentFields.account) String? account,
      @JsonKey(name: PaymentFields.type) AccountType? type,
      @JsonKey(name: PaymentFields.name) String? name,
      @JsonKey(name: PaymentFields.isChecked) bool? isChecked,
      @JsonKey(name: PaymentFields.expiryDate) String? expiryDate,
      @JsonKey(
          name: PaymentFields.createdAt,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
      DateTime? createdAt,
      @JsonKey(name: PaymentFields.updatedAt) DateTime? updatedAt,
      @JsonKey(name: PaymentFields.cvv) String? cvv});
}

/// @nodoc
class _$PaymentModelCopyWithImpl<$Res, $Val extends PaymentModel>
    implements $PaymentModelCopyWith<$Res> {
  _$PaymentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? shopId = freezed,
    Object? userId = freezed,
    Object? account = freezed,
    Object? type = freezed,
    Object? name = freezed,
    Object? isChecked = freezed,
    Object? expiryDate = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? cvv = freezed,
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
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AccountType?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      isChecked: freezed == isChecked
          ? _value.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool?,
      expiryDate: freezed == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cvv: freezed == cvv
          ? _value.cvv
          : cvv // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentModelImplCopyWith<$Res>
    implements $PaymentModelCopyWith<$Res> {
  factory _$$PaymentModelImplCopyWith(
          _$PaymentModelImpl value, $Res Function(_$PaymentModelImpl) then) =
      __$$PaymentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: PaymentFields.shopId) String? shopId,
      @JsonKey(name: PaymentFields.userId) String? userId,
      @JsonKey(name: PaymentFields.account) String? account,
      @JsonKey(name: PaymentFields.type) AccountType? type,
      @JsonKey(name: PaymentFields.name) String? name,
      @JsonKey(name: PaymentFields.isChecked) bool? isChecked,
      @JsonKey(name: PaymentFields.expiryDate) String? expiryDate,
      @JsonKey(
          name: PaymentFields.createdAt,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
      DateTime? createdAt,
      @JsonKey(name: PaymentFields.updatedAt) DateTime? updatedAt,
      @JsonKey(name: PaymentFields.cvv) String? cvv});
}

/// @nodoc
class __$$PaymentModelImplCopyWithImpl<$Res>
    extends _$PaymentModelCopyWithImpl<$Res, _$PaymentModelImpl>
    implements _$$PaymentModelImplCopyWith<$Res> {
  __$$PaymentModelImplCopyWithImpl(
      _$PaymentModelImpl _value, $Res Function(_$PaymentModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? shopId = freezed,
    Object? userId = freezed,
    Object? account = freezed,
    Object? type = freezed,
    Object? name = freezed,
    Object? isChecked = freezed,
    Object? expiryDate = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? cvv = freezed,
  }) {
    return _then(_$PaymentModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      shopId: freezed == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AccountType?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      isChecked: freezed == isChecked
          ? _value.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool?,
      expiryDate: freezed == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cvv: freezed == cvv
          ? _value.cvv
          : cvv // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$PaymentModelImpl implements _PaymentModel {
  _$PaymentModelImpl(
      {this.id,
      @JsonKey(name: PaymentFields.shopId) this.shopId,
      @JsonKey(name: PaymentFields.userId) this.userId,
      @JsonKey(name: PaymentFields.account) this.account,
      @JsonKey(name: PaymentFields.type) this.type,
      @JsonKey(name: PaymentFields.name) this.name,
      @JsonKey(name: PaymentFields.isChecked) this.isChecked,
      @JsonKey(name: PaymentFields.expiryDate) this.expiryDate,
      @JsonKey(
          name: PaymentFields.createdAt,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
      this.createdAt,
      @JsonKey(name: PaymentFields.updatedAt) this.updatedAt,
      @JsonKey(name: PaymentFields.cvv) this.cvv});

  factory _$PaymentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentModelImplFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: PaymentFields.shopId)
  final String? shopId;
  @override
  @JsonKey(name: PaymentFields.userId)
  final String? userId;
  @override
  @JsonKey(name: PaymentFields.account)
  final String? account;
  @override
  @JsonKey(name: PaymentFields.type)
  final AccountType? type;
  @override
  @JsonKey(name: PaymentFields.name)
  final String? name;
  @override
  @JsonKey(name: PaymentFields.isChecked)
  final bool? isChecked;
  @override
  @JsonKey(name: PaymentFields.expiryDate)
  final String? expiryDate;
  @override
  @JsonKey(
      name: PaymentFields.createdAt,
      fromJson: DateUtils.timestampToDateTime,
      toJson: DateUtils.dateTimeToTimestamp)
  final DateTime? createdAt;
  @override
  @JsonKey(name: PaymentFields.updatedAt)
  final DateTime? updatedAt;
  @override
  @JsonKey(name: PaymentFields.cvv)
  final String? cvv;

  @override
  String toString() {
    return 'PaymentModel(id: $id, shopId: $shopId, userId: $userId, account: $account, type: $type, name: $name, isChecked: $isChecked, expiryDate: $expiryDate, createdAt: $createdAt, updatedAt: $updatedAt, cvv: $cvv)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.shopId, shopId) || other.shopId == shopId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.cvv, cvv) || other.cvv == cvv));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, shopId, userId, account,
      type, name, isChecked, expiryDate, createdAt, updatedAt, cvv);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentModelImplCopyWith<_$PaymentModelImpl> get copyWith =>
      __$$PaymentModelImplCopyWithImpl<_$PaymentModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentModelImplToJson(
      this,
    );
  }
}

abstract class _PaymentModel implements PaymentModel {
  factory _PaymentModel(
          {final String? id,
          @JsonKey(name: PaymentFields.shopId) final String? shopId,
          @JsonKey(name: PaymentFields.userId) final String? userId,
          @JsonKey(name: PaymentFields.account) final String? account,
          @JsonKey(name: PaymentFields.type) final AccountType? type,
          @JsonKey(name: PaymentFields.name) final String? name,
          @JsonKey(name: PaymentFields.isChecked) final bool? isChecked,
          @JsonKey(name: PaymentFields.expiryDate) final String? expiryDate,
          @JsonKey(
              name: PaymentFields.createdAt,
              fromJson: DateUtils.timestampToDateTime,
              toJson: DateUtils.dateTimeToTimestamp)
          final DateTime? createdAt,
          @JsonKey(name: PaymentFields.updatedAt) final DateTime? updatedAt,
          @JsonKey(name: PaymentFields.cvv) final String? cvv}) =
      _$PaymentModelImpl;

  factory _PaymentModel.fromJson(Map<String, dynamic> json) =
      _$PaymentModelImpl.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(name: PaymentFields.shopId)
  String? get shopId;
  @override
  @JsonKey(name: PaymentFields.userId)
  String? get userId;
  @override
  @JsonKey(name: PaymentFields.account)
  String? get account;
  @override
  @JsonKey(name: PaymentFields.type)
  AccountType? get type;
  @override
  @JsonKey(name: PaymentFields.name)
  String? get name;
  @override
  @JsonKey(name: PaymentFields.isChecked)
  bool? get isChecked;
  @override
  @JsonKey(name: PaymentFields.expiryDate)
  String? get expiryDate;
  @override
  @JsonKey(
      name: PaymentFields.createdAt,
      fromJson: DateUtils.timestampToDateTime,
      toJson: DateUtils.dateTimeToTimestamp)
  DateTime? get createdAt;
  @override
  @JsonKey(name: PaymentFields.updatedAt)
  DateTime? get updatedAt;
  @override
  @JsonKey(name: PaymentFields.cvv)
  String? get cvv;
  @override
  @JsonKey(ignore: true)
  _$$PaymentModelImplCopyWith<_$PaymentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
