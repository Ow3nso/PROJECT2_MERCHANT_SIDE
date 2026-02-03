// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Wallet _$WalletFromJson(Map<String, dynamic> json) {
  return _Wallet.fromJson(json);
}

/// @nodoc
mixin _$Wallet {
  @JsonKey(
      name: WalletFields.createdAt,
      fromJson: DateUtils.timestampToDateTime,
      toJson: DateUtils.dateTimeToTimestamp)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: WalletFields.id)
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: WalletFields.balance)
  double? get balance => throw _privateConstructorUsedError;
  @JsonKey(name: WalletFields.updatedAt)
  int? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: WalletFields.availableBalance)
  double? get availableBalance => throw _privateConstructorUsedError;
  @JsonKey(name: WalletFields.pendingBalance)
  double? get pendingBalance => throw _privateConstructorUsedError;
  @JsonKey(name: WalletFields.currency)
  String? get currency => throw _privateConstructorUsedError;
  @JsonKey(name: WalletFields.name)
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: WalletFields.shopId)
  String? get shopId => throw _privateConstructorUsedError;
  @JsonKey(name: WalletFields.userId)
  String? get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WalletCopyWith<Wallet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletCopyWith<$Res> {
  factory $WalletCopyWith(Wallet value, $Res Function(Wallet) then) =
      _$WalletCopyWithImpl<$Res, Wallet>;
  @useResult
  $Res call(
      {@JsonKey(
          name: WalletFields.createdAt,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
      DateTime? createdAt,
      @JsonKey(name: WalletFields.id) String? id,
      @JsonKey(name: WalletFields.balance) double? balance,
      @JsonKey(name: WalletFields.updatedAt) int? updatedAt,
      @JsonKey(name: WalletFields.availableBalance) double? availableBalance,
      @JsonKey(name: WalletFields.pendingBalance) double? pendingBalance,
      @JsonKey(name: WalletFields.currency) String? currency,
      @JsonKey(name: WalletFields.name) String? name,
      @JsonKey(name: WalletFields.shopId) String? shopId,
      @JsonKey(name: WalletFields.userId) String? userId});
}

/// @nodoc
class _$WalletCopyWithImpl<$Res, $Val extends Wallet>
    implements $WalletCopyWith<$Res> {
  _$WalletCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = freezed,
    Object? balance = freezed,
    Object? updatedAt = freezed,
    Object? availableBalance = freezed,
    Object? pendingBalance = freezed,
    Object? currency = freezed,
    Object? name = freezed,
    Object? shopId = freezed,
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      availableBalance: freezed == availableBalance
          ? _value.availableBalance
          : availableBalance // ignore: cast_nullable_to_non_nullable
              as double?,
      pendingBalance: freezed == pendingBalance
          ? _value.pendingBalance
          : pendingBalance // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      shopId: freezed == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalletImplCopyWith<$Res> implements $WalletCopyWith<$Res> {
  factory _$$WalletImplCopyWith(
          _$WalletImpl value, $Res Function(_$WalletImpl) then) =
      __$$WalletImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          name: WalletFields.createdAt,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
      DateTime? createdAt,
      @JsonKey(name: WalletFields.id) String? id,
      @JsonKey(name: WalletFields.balance) double? balance,
      @JsonKey(name: WalletFields.updatedAt) int? updatedAt,
      @JsonKey(name: WalletFields.availableBalance) double? availableBalance,
      @JsonKey(name: WalletFields.pendingBalance) double? pendingBalance,
      @JsonKey(name: WalletFields.currency) String? currency,
      @JsonKey(name: WalletFields.name) String? name,
      @JsonKey(name: WalletFields.shopId) String? shopId,
      @JsonKey(name: WalletFields.userId) String? userId});
}

/// @nodoc
class __$$WalletImplCopyWithImpl<$Res>
    extends _$WalletCopyWithImpl<$Res, _$WalletImpl>
    implements _$$WalletImplCopyWith<$Res> {
  __$$WalletImplCopyWithImpl(
      _$WalletImpl _value, $Res Function(_$WalletImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = freezed,
    Object? balance = freezed,
    Object? updatedAt = freezed,
    Object? availableBalance = freezed,
    Object? pendingBalance = freezed,
    Object? currency = freezed,
    Object? name = freezed,
    Object? shopId = freezed,
    Object? userId = freezed,
  }) {
    return _then(_$WalletImpl(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      availableBalance: freezed == availableBalance
          ? _value.availableBalance
          : availableBalance // ignore: cast_nullable_to_non_nullable
              as double?,
      pendingBalance: freezed == pendingBalance
          ? _value.pendingBalance
          : pendingBalance // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      shopId: freezed == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$WalletImpl implements _Wallet {
  _$WalletImpl(
      {@JsonKey(
          name: WalletFields.createdAt,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
      this.createdAt,
      @JsonKey(name: WalletFields.id) this.id,
      @JsonKey(name: WalletFields.balance) this.balance,
      @JsonKey(name: WalletFields.updatedAt) this.updatedAt,
      @JsonKey(name: WalletFields.availableBalance) this.availableBalance,
      @JsonKey(name: WalletFields.pendingBalance) this.pendingBalance,
      @JsonKey(name: WalletFields.currency) this.currency,
      @JsonKey(name: WalletFields.name) this.name,
      @JsonKey(name: WalletFields.shopId) this.shopId,
      @JsonKey(name: WalletFields.userId) this.userId});

  factory _$WalletImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalletImplFromJson(json);

  @override
  @JsonKey(
      name: WalletFields.createdAt,
      fromJson: DateUtils.timestampToDateTime,
      toJson: DateUtils.dateTimeToTimestamp)
  final DateTime? createdAt;
  @override
  @JsonKey(name: WalletFields.id)
  final String? id;
  @override
  @JsonKey(name: WalletFields.balance)
  final double? balance;
  @override
  @JsonKey(name: WalletFields.updatedAt)
  final int? updatedAt;
  @override
  @JsonKey(name: WalletFields.availableBalance)
  final double? availableBalance;
  @override
  @JsonKey(name: WalletFields.pendingBalance)
  final double? pendingBalance;
  @override
  @JsonKey(name: WalletFields.currency)
  final String? currency;
  @override
  @JsonKey(name: WalletFields.name)
  final String? name;
  @override
  @JsonKey(name: WalletFields.shopId)
  final String? shopId;
  @override
  @JsonKey(name: WalletFields.userId)
  final String? userId;

  @override
  String toString() {
    return 'Wallet(createdAt: $createdAt, id: $id, balance: $balance, updatedAt: $updatedAt, availableBalance: $availableBalance, pendingBalance: $pendingBalance, currency: $currency, name: $name, shopId: $shopId, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.availableBalance, availableBalance) ||
                other.availableBalance == availableBalance) &&
            (identical(other.pendingBalance, pendingBalance) ||
                other.pendingBalance == pendingBalance) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.shopId, shopId) || other.shopId == shopId) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      createdAt,
      id,
      balance,
      updatedAt,
      availableBalance,
      pendingBalance,
      currency,
      name,
      shopId,
      userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletImplCopyWith<_$WalletImpl> get copyWith =>
      __$$WalletImplCopyWithImpl<_$WalletImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletImplToJson(
      this,
    );
  }
}

abstract class _Wallet implements Wallet {
  factory _Wallet(
      {@JsonKey(
          name: WalletFields.createdAt,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
      final DateTime? createdAt,
      @JsonKey(name: WalletFields.id) final String? id,
      @JsonKey(name: WalletFields.balance) final double? balance,
      @JsonKey(name: WalletFields.updatedAt) final int? updatedAt,
      @JsonKey(name: WalletFields.availableBalance)
      final double? availableBalance,
      @JsonKey(name: WalletFields.pendingBalance) final double? pendingBalance,
      @JsonKey(name: WalletFields.currency) final String? currency,
      @JsonKey(name: WalletFields.name) final String? name,
      @JsonKey(name: WalletFields.shopId) final String? shopId,
      @JsonKey(name: WalletFields.userId) final String? userId}) = _$WalletImpl;

  factory _Wallet.fromJson(Map<String, dynamic> json) = _$WalletImpl.fromJson;

  @override
  @JsonKey(
      name: WalletFields.createdAt,
      fromJson: DateUtils.timestampToDateTime,
      toJson: DateUtils.dateTimeToTimestamp)
  DateTime? get createdAt;
  @override
  @JsonKey(name: WalletFields.id)
  String? get id;
  @override
  @JsonKey(name: WalletFields.balance)
  double? get balance;
  @override
  @JsonKey(name: WalletFields.updatedAt)
  int? get updatedAt;
  @override
  @JsonKey(name: WalletFields.availableBalance)
  double? get availableBalance;
  @override
  @JsonKey(name: WalletFields.pendingBalance)
  double? get pendingBalance;
  @override
  @JsonKey(name: WalletFields.currency)
  String? get currency;
  @override
  @JsonKey(name: WalletFields.name)
  String? get name;
  @override
  @JsonKey(name: WalletFields.shopId)
  String? get shopId;
  @override
  @JsonKey(name: WalletFields.userId)
  String? get userId;
  @override
  @JsonKey(ignore: true)
  _$$WalletImplCopyWith<_$WalletImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
