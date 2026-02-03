// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return _Transaction.fromJson(json);
}

/// @nodoc
mixin _$Transaction {
  // @JsonKey(
  //     name: TransactionFields.createdAt,
  //     fromJson: DateUtils.timestampToDateTime,
  //     toJson: DateUtils.dateTimeToTimestamp)
  // DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: TransactionFields.createdAt)
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: TransactionFields.id)
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: TransactionFields.amount, fromJson: _stringToDouble)
  double? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: TransactionFields.currency)
  String? get currency => throw _privateConstructorUsedError;
  @JsonKey(name: TransactionFields.description)
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: TransactionFields.status)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: TransactionFields.type)
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: TransactionFields.updatedAt)
  int? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: TransactionFields.walletId)
  String? get walletId => throw _privateConstructorUsedError;
  @JsonKey(name: TransactionFields.transactionId)
  String? get transactionId => throw _privateConstructorUsedError;
  @JsonKey(name: TransactionFields.userId)
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: TransactionFields.metadata)
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  @JsonKey(name: TransactionFields.imageUrl)
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: TransactionFields.shopId)
  String? get shopId => throw _privateConstructorUsedError;
  @JsonKey(name: TransactionFields.newBalance)
  String? get newBalance => throw _privateConstructorUsedError;
  @JsonKey(name: TransactionFields.reference, fromJson: _stringToDouble)
  double? get reference => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionCopyWith<Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCopyWith<$Res> {
  factory $TransactionCopyWith(
          Transaction value, $Res Function(Transaction) then) =
      _$TransactionCopyWithImpl<$Res, Transaction>;
  @useResult
  $Res call(
      {
      //   @JsonKey(
      //     name: TransactionFields.createdAt,
      //     fromJson: DateUtils.timestampToDateTime,
      //     toJson: DateUtils.dateTimeToTimestamp)
      // DateTime? createdAt,
      @JsonKey(name: TransactionFields.createdAt) String? createdAt,
      @JsonKey(name: TransactionFields.id) String? id,
      @JsonKey(name: TransactionFields.amount, fromJson: _stringToDouble)
      double? amount,
      @JsonKey(name: TransactionFields.currency) String? currency,
      @JsonKey(name: TransactionFields.description) String? description,
      @JsonKey(name: TransactionFields.status) String? status,
      @JsonKey(name: TransactionFields.type) String? type,
      @JsonKey(name: TransactionFields.updatedAt) int? updatedAt,
      @JsonKey(name: TransactionFields.walletId) String? walletId,
      @JsonKey(name: TransactionFields.transactionId) String? transactionId,
      @JsonKey(name: TransactionFields.userId) String? userId,
      @JsonKey(name: TransactionFields.metadata) Map<String, dynamic>? metadata,
      @JsonKey(name: TransactionFields.imageUrl) String? imageUrl,
      @JsonKey(name: TransactionFields.shopId) String? shopId,
      @JsonKey(name: TransactionFields.newBalance) String? newBalance,
      @JsonKey(name: TransactionFields.reference, fromJson: _stringToDouble)
      double? reference});
}

/// @nodoc
class _$TransactionCopyWithImpl<$Res, $Val extends Transaction>
    implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = freezed,
    Object? amount = freezed,
    Object? currency = freezed,
    Object? description = freezed,
    Object? status = freezed,
    Object? type = freezed,
    Object? updatedAt = freezed,
    Object? walletId = freezed,
    Object? transactionId = freezed,
    Object? userId = freezed,
    Object? metadata = freezed,
    Object? imageUrl = freezed,
    Object? shopId = freezed,
    Object? newBalance = freezed,
    Object? reference = freezed,
  }) {
    return _then(_value.copyWith(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      walletId: freezed == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      shopId: freezed == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as String?,
      newBalance: freezed == newBalance
          ? _value.newBalance
          : newBalance // ignore: cast_nullable_to_non_nullable
              as String?,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionImplCopyWith<$Res>
    implements $TransactionCopyWith<$Res> {
  factory _$$TransactionImplCopyWith(
          _$TransactionImpl value, $Res Function(_$TransactionImpl) then) =
      __$$TransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {
        
      @JsonKey(name: TransactionFields.createdAt) String? createdAt,
      @JsonKey(name: TransactionFields.id) String? id,
      @JsonKey(name: TransactionFields.amount, fromJson: _stringToDouble)
      double? amount,
      @JsonKey(name: TransactionFields.currency) String? currency,
      @JsonKey(name: TransactionFields.description) String? description,
      @JsonKey(name: TransactionFields.status) String? status,
      @JsonKey(name: TransactionFields.type) String? type,
      @JsonKey(name: TransactionFields.updatedAt) int? updatedAt,
      @JsonKey(name: TransactionFields.walletId) String? walletId,
      @JsonKey(name: TransactionFields.transactionId) String? transactionId,
      @JsonKey(name: TransactionFields.userId) String? userId,
      @JsonKey(name: TransactionFields.metadata) Map<String, dynamic>? metadata,
      @JsonKey(name: TransactionFields.imageUrl) String? imageUrl,
      @JsonKey(name: TransactionFields.shopId) String? shopId,
      @JsonKey(name: TransactionFields.newBalance) String? newBalance,
      @JsonKey(name: TransactionFields.reference, fromJson: _stringToDouble)
      double? reference});
}

/// @nodoc
class __$$TransactionImplCopyWithImpl<$Res>
    extends _$TransactionCopyWithImpl<$Res, _$TransactionImpl>
    implements _$$TransactionImplCopyWith<$Res> {
  __$$TransactionImplCopyWithImpl(
      _$TransactionImpl _value, $Res Function(_$TransactionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = freezed,
    Object? amount = freezed,
    Object? currency = freezed,
    Object? description = freezed,
    Object? status = freezed,
    Object? type = freezed,
    Object? updatedAt = freezed,
    Object? walletId = freezed,
    Object? transactionId = freezed,
    Object? userId = freezed,
    Object? metadata = freezed,
    Object? imageUrl = freezed,
    Object? shopId = freezed,
    Object? newBalance = freezed,
    Object? reference = freezed,
  }) {
    return _then(_$TransactionImpl(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      walletId: freezed == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      shopId: freezed == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as String?,
      newBalance: freezed == newBalance
          ? _value.newBalance
          : newBalance // ignore: cast_nullable_to_non_nullable
              as String?,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$TransactionImpl implements _Transaction {
  _$TransactionImpl(
      {
      //   @JsonKey(
      //     name: TransactionFields.createdAt,
      //     fromJson: DateUtils.timestampToDateTime,
      //     toJson: DateUtils.dateTimeToTimestamp)
      // this.createdAt,
      @JsonKey(name: TransactionFields.createdAt) this.createdAt,
      @JsonKey(name: TransactionFields.id) this.id,
      @JsonKey(name: TransactionFields.amount, fromJson: _stringToDouble)
      this.amount,
      @JsonKey(name: TransactionFields.currency) this.currency,
      @JsonKey(name: TransactionFields.description) this.description,
      @JsonKey(name: TransactionFields.status) this.status,
      @JsonKey(name: TransactionFields.type) this.type,
      @JsonKey(name: TransactionFields.updatedAt) this.updatedAt,
      @JsonKey(name: TransactionFields.walletId) this.walletId,
      @JsonKey(name: TransactionFields.transactionId) this.transactionId,
      @JsonKey(name: TransactionFields.userId) this.userId,
      @JsonKey(name: TransactionFields.metadata)
      final Map<String, dynamic>? metadata,
      @JsonKey(name: TransactionFields.imageUrl) this.imageUrl,
      @JsonKey(name: TransactionFields.shopId) this.shopId,
      @JsonKey(name: TransactionFields.newBalance) this.newBalance,
      @JsonKey(name: TransactionFields.reference, fromJson: _stringToDouble)
      this.reference})
      : _metadata = metadata;

  factory _$TransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionImplFromJson(json);

  @override
  @JsonKey(name: TransactionFields.createdAt)
  final String? createdAt;
  @override
  @JsonKey(name: TransactionFields.id)
  final String? id;
  @override
  @JsonKey(name: TransactionFields.amount, fromJson: _stringToDouble)
  final double? amount;
  @override
  @JsonKey(name: TransactionFields.currency)
  final String? currency;
  @override
  @JsonKey(name: TransactionFields.description)
  final String? description;
  @override
  @JsonKey(name: TransactionFields.status)
  final String? status;
  @override
  @JsonKey(name: TransactionFields.type)
  final String? type;
  @override
  @JsonKey(name: TransactionFields.updatedAt)
  final int? updatedAt;
  @override
  @JsonKey(name: TransactionFields.walletId)
  final String? walletId;
  @override
  @JsonKey(name: TransactionFields.transactionId)
  final String? transactionId;
  @override
  @JsonKey(name: TransactionFields.userId)
  final String? userId;
  final Map<String, dynamic>? _metadata;
  @override
  @JsonKey(name: TransactionFields.metadata)
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(name: TransactionFields.imageUrl)
  final String? imageUrl;
  @override
  @JsonKey(name: TransactionFields.shopId)
  final String? shopId;
  @override
  @JsonKey(name: TransactionFields.newBalance)
  final String? newBalance;
  @override
  @JsonKey(name: TransactionFields.reference, fromJson: _stringToDouble)
  final double? reference;

  @override
  String toString() {
    return 'Transaction(createdAt: $createdAt, id: $id, amount: $amount, currency: $currency, description: $description, status: $status, type: $type, updatedAt: $updatedAt, walletId: $walletId, transactionId: $transactionId, userId: $userId, metadata: $metadata, imageUrl: $imageUrl, shopId: $shopId, newBalance: $newBalance, reference: $reference)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.walletId, walletId) ||
                other.walletId == walletId) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.shopId, shopId) || other.shopId == shopId) &&
            (identical(other.newBalance, newBalance) ||
                other.newBalance == newBalance) &&
            (identical(other.reference, reference) ||
                other.reference == reference));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      createdAt,
      id,
      amount,
      currency,
      description,
      status,
      type,
      updatedAt,
      walletId,
      transactionId,
      userId,
      const DeepCollectionEquality().hash(_metadata),
      imageUrl,
      shopId,
      newBalance,
      reference);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionImplCopyWith<_$TransactionImpl> get copyWith =>
      __$$TransactionImplCopyWithImpl<_$TransactionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionImplToJson(
      this,
    );
  }
}

abstract class _Transaction implements Transaction {
  factory _Transaction(
      {
      @JsonKey(name: TransactionFields.createdAt) final String? createdAt,
      @JsonKey(name: TransactionFields.id) final String? id,
      @JsonKey(name: TransactionFields.amount, fromJson: _stringToDouble)
      final double? amount,
      @JsonKey(name: TransactionFields.currency) final String? currency,
      @JsonKey(name: TransactionFields.description) final String? description,
      @JsonKey(name: TransactionFields.status) final String? status,
      @JsonKey(name: TransactionFields.type) final String? type,
      @JsonKey(name: TransactionFields.updatedAt) final int? updatedAt,
      @JsonKey(name: TransactionFields.walletId) final String? walletId,
      @JsonKey(name: TransactionFields.transactionId)
      final String? transactionId,
      @JsonKey(name: TransactionFields.userId) final String? userId,
      @JsonKey(name: TransactionFields.metadata)
      final Map<String, dynamic>? metadata,
      @JsonKey(name: TransactionFields.imageUrl) final String? imageUrl,
      @JsonKey(name: TransactionFields.shopId) final String? shopId,
      @JsonKey(name: TransactionFields.newBalance) final String? newBalance,
      @JsonKey(name: TransactionFields.reference, fromJson: _stringToDouble)
      final double? reference}) = _$TransactionImpl;

  factory _Transaction.fromJson(Map<String, dynamic> json) =
      _$TransactionImpl.fromJson;

  @override
  @JsonKey(name: TransactionFields.createdAt)
  String? get createdAt;
  @override
  @JsonKey(name: TransactionFields.id)
  String? get id;
  @override
  @JsonKey(name: TransactionFields.amount, fromJson: _stringToDouble)
  double? get amount;
  @override
  @JsonKey(name: TransactionFields.currency)
  String? get currency;
  @override
  @JsonKey(name: TransactionFields.description)
  String? get description;
  @override
  @JsonKey(name: TransactionFields.status)
  String? get status;
  @override
  @JsonKey(name: TransactionFields.type)
  String? get type;
  @override
  @JsonKey(name: TransactionFields.updatedAt)
  int? get updatedAt;
  @override
  @JsonKey(name: TransactionFields.walletId)
  String? get walletId;
  @override
  @JsonKey(name: TransactionFields.transactionId)
  String? get transactionId;
  @override
  @JsonKey(name: TransactionFields.userId)
  String? get userId;
  @override
  @JsonKey(name: TransactionFields.metadata)
  Map<String, dynamic>? get metadata;
  @override
  @JsonKey(name: TransactionFields.imageUrl)
  String? get imageUrl;
  @override
  @JsonKey(name: TransactionFields.shopId)
  String? get shopId;
  @override
  @JsonKey(name: TransactionFields.newBalance)
  String? get newBalance;
  @override
  @JsonKey(name: TransactionFields.reference, fromJson: _stringToDouble)
  double? get reference;
  @override
  @JsonKey(ignore: true)
  _$$TransactionImplCopyWith<_$TransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
