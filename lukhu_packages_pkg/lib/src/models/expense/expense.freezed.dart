// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Expense _$ExpenseFromJson(Map<String, dynamic> json) {
  return _Expense.fromJson(json);
}

/// @nodoc
mixin _$Expense {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: ExpenseFields.name)
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: ExpenseFields.category)
  ExpenseCategory? get category => throw _privateConstructorUsedError;
  @JsonKey(name: ExpenseFields.fromDate)
  DateTime? get fromdate => throw _privateConstructorUsedError;
  @JsonKey(name: ExpenseFields.toDate)
  DateTime? get toDate => throw _privateConstructorUsedError;
  @JsonKey(name: ExpenseFields.amount)
  double? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: ExpenseFields.note)
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: ExpenseFields.imageUrl)
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: ExpenseFields.description)
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(
      name: ExpenseFields.createAt,
      fromJson: DateUtils.timestampToDateTime,
      toJson: DateUtils.dateTimeToTimestamp)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(
      name: ExpenseFields.updateAt,
      fromJson: DateUtils.timestampToDateTime,
      toJson: DateUtils.dateTimeToTimestamp)
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: ExpenseFields.shopId)
  String? get shopId => throw _privateConstructorUsedError;
  @JsonKey(name: ExpenseFields.userId)
  String? get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExpenseCopyWith<Expense> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseCopyWith<$Res> {
  factory $ExpenseCopyWith(Expense value, $Res Function(Expense) then) =
      _$ExpenseCopyWithImpl<$Res, Expense>;
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: ExpenseFields.name) String? name,
      @JsonKey(name: ExpenseFields.category) ExpenseCategory? category,
      @JsonKey(name: ExpenseFields.fromDate) DateTime? fromdate,
      @JsonKey(name: ExpenseFields.toDate) DateTime? toDate,
      @JsonKey(name: ExpenseFields.amount) double? amount,
      @JsonKey(name: ExpenseFields.note) String? note,
      @JsonKey(name: ExpenseFields.imageUrl) String? imageUrl,
      @JsonKey(name: ExpenseFields.description) String? description,
      @JsonKey(
          name: ExpenseFields.createAt,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
      DateTime? createdAt,
      @JsonKey(
          name: ExpenseFields.updateAt,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
      DateTime? updatedAt,
      @JsonKey(name: ExpenseFields.shopId) String? shopId,
      @JsonKey(name: ExpenseFields.userId) String? userId});
}

/// @nodoc
class _$ExpenseCopyWithImpl<$Res, $Val extends Expense>
    implements $ExpenseCopyWith<$Res> {
  _$ExpenseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? category = freezed,
    Object? fromdate = freezed,
    Object? toDate = freezed,
    Object? amount = freezed,
    Object? note = freezed,
    Object? imageUrl = freezed,
    Object? description = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? shopId = freezed,
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ExpenseCategory?,
      fromdate: freezed == fromdate
          ? _value.fromdate
          : fromdate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      toDate: freezed == toDate
          ? _value.toDate
          : toDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
abstract class _$$ExpenseImplCopyWith<$Res> implements $ExpenseCopyWith<$Res> {
  factory _$$ExpenseImplCopyWith(
          _$ExpenseImpl value, $Res Function(_$ExpenseImpl) then) =
      __$$ExpenseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: ExpenseFields.name) String? name,
      @JsonKey(name: ExpenseFields.category) ExpenseCategory? category,
      @JsonKey(name: ExpenseFields.fromDate) DateTime? fromdate,
      @JsonKey(name: ExpenseFields.toDate) DateTime? toDate,
      @JsonKey(name: ExpenseFields.amount) double? amount,
      @JsonKey(name: ExpenseFields.note) String? note,
      @JsonKey(name: ExpenseFields.imageUrl) String? imageUrl,
      @JsonKey(name: ExpenseFields.description) String? description,
      @JsonKey(
          name: ExpenseFields.createAt,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
      DateTime? createdAt,
      @JsonKey(
          name: ExpenseFields.updateAt,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
      DateTime? updatedAt,
      @JsonKey(name: ExpenseFields.shopId) String? shopId,
      @JsonKey(name: ExpenseFields.userId) String? userId});
}

/// @nodoc
class __$$ExpenseImplCopyWithImpl<$Res>
    extends _$ExpenseCopyWithImpl<$Res, _$ExpenseImpl>
    implements _$$ExpenseImplCopyWith<$Res> {
  __$$ExpenseImplCopyWithImpl(
      _$ExpenseImpl _value, $Res Function(_$ExpenseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? category = freezed,
    Object? fromdate = freezed,
    Object? toDate = freezed,
    Object? amount = freezed,
    Object? note = freezed,
    Object? imageUrl = freezed,
    Object? description = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? shopId = freezed,
    Object? userId = freezed,
  }) {
    return _then(_$ExpenseImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ExpenseCategory?,
      fromdate: freezed == fromdate
          ? _value.fromdate
          : fromdate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      toDate: freezed == toDate
          ? _value.toDate
          : toDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
class _$ExpenseImpl implements _Expense {
  _$ExpenseImpl(
      {this.id,
      @JsonKey(name: ExpenseFields.name) this.name,
      @JsonKey(name: ExpenseFields.category) this.category,
      @JsonKey(name: ExpenseFields.fromDate) this.fromdate,
      @JsonKey(name: ExpenseFields.toDate) this.toDate,
      @JsonKey(name: ExpenseFields.amount) this.amount,
      @JsonKey(name: ExpenseFields.note) this.note,
      @JsonKey(name: ExpenseFields.imageUrl) this.imageUrl,
      @JsonKey(name: ExpenseFields.description) this.description,
      @JsonKey(
          name: ExpenseFields.createAt,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
      this.createdAt,
      @JsonKey(
          name: ExpenseFields.updateAt,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
      this.updatedAt,
      @JsonKey(name: ExpenseFields.shopId) this.shopId,
      @JsonKey(name: ExpenseFields.userId) this.userId});

  factory _$ExpenseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpenseImplFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: ExpenseFields.name)
  final String? name;
  @override
  @JsonKey(name: ExpenseFields.category)
  final ExpenseCategory? category;
  @override
  @JsonKey(name: ExpenseFields.fromDate)
  final DateTime? fromdate;
  @override
  @JsonKey(name: ExpenseFields.toDate)
  final DateTime? toDate;
  @override
  @JsonKey(name: ExpenseFields.amount)
  final double? amount;
  @override
  @JsonKey(name: ExpenseFields.note)
  final String? note;
  @override
  @JsonKey(name: ExpenseFields.imageUrl)
  final String? imageUrl;
  @override
  @JsonKey(name: ExpenseFields.description)
  final String? description;
  @override
  @JsonKey(
      name: ExpenseFields.createAt,
      fromJson: DateUtils.timestampToDateTime,
      toJson: DateUtils.dateTimeToTimestamp)
  final DateTime? createdAt;
  @override
  @JsonKey(
      name: ExpenseFields.updateAt,
      fromJson: DateUtils.timestampToDateTime,
      toJson: DateUtils.dateTimeToTimestamp)
  final DateTime? updatedAt;
  @override
  @JsonKey(name: ExpenseFields.shopId)
  final String? shopId;
  @override
  @JsonKey(name: ExpenseFields.userId)
  final String? userId;

  @override
  String toString() {
    return 'Expense(id: $id, name: $name, category: $category, fromdate: $fromdate, toDate: $toDate, amount: $amount, note: $note, imageUrl: $imageUrl, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, shopId: $shopId, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpenseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.fromdate, fromdate) ||
                other.fromdate == fromdate) &&
            (identical(other.toDate, toDate) || other.toDate == toDate) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.shopId, shopId) || other.shopId == shopId) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      category,
      fromdate,
      toDate,
      amount,
      note,
      imageUrl,
      description,
      createdAt,
      updatedAt,
      shopId,
      userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpenseImplCopyWith<_$ExpenseImpl> get copyWith =>
      __$$ExpenseImplCopyWithImpl<_$ExpenseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpenseImplToJson(
      this,
    );
  }
}

abstract class _Expense implements Expense {
  factory _Expense(
      {final String? id,
      @JsonKey(name: ExpenseFields.name) final String? name,
      @JsonKey(name: ExpenseFields.category) final ExpenseCategory? category,
      @JsonKey(name: ExpenseFields.fromDate) final DateTime? fromdate,
      @JsonKey(name: ExpenseFields.toDate) final DateTime? toDate,
      @JsonKey(name: ExpenseFields.amount) final double? amount,
      @JsonKey(name: ExpenseFields.note) final String? note,
      @JsonKey(name: ExpenseFields.imageUrl) final String? imageUrl,
      @JsonKey(name: ExpenseFields.description) final String? description,
      @JsonKey(
          name: ExpenseFields.createAt,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
      final DateTime? createdAt,
      @JsonKey(
          name: ExpenseFields.updateAt,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
      final DateTime? updatedAt,
      @JsonKey(name: ExpenseFields.shopId) final String? shopId,
      @JsonKey(name: ExpenseFields.userId)
      final String? userId}) = _$ExpenseImpl;

  factory _Expense.fromJson(Map<String, dynamic> json) = _$ExpenseImpl.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(name: ExpenseFields.name)
  String? get name;
  @override
  @JsonKey(name: ExpenseFields.category)
  ExpenseCategory? get category;
  @override
  @JsonKey(name: ExpenseFields.fromDate)
  DateTime? get fromdate;
  @override
  @JsonKey(name: ExpenseFields.toDate)
  DateTime? get toDate;
  @override
  @JsonKey(name: ExpenseFields.amount)
  double? get amount;
  @override
  @JsonKey(name: ExpenseFields.note)
  String? get note;
  @override
  @JsonKey(name: ExpenseFields.imageUrl)
  String? get imageUrl;
  @override
  @JsonKey(name: ExpenseFields.description)
  String? get description;
  @override
  @JsonKey(
      name: ExpenseFields.createAt,
      fromJson: DateUtils.timestampToDateTime,
      toJson: DateUtils.dateTimeToTimestamp)
  DateTime? get createdAt;
  @override
  @JsonKey(
      name: ExpenseFields.updateAt,
      fromJson: DateUtils.timestampToDateTime,
      toJson: DateUtils.dateTimeToTimestamp)
  DateTime? get updatedAt;
  @override
  @JsonKey(name: ExpenseFields.shopId)
  String? get shopId;
  @override
  @JsonKey(name: ExpenseFields.userId)
  String? get userId;
  @override
  @JsonKey(ignore: true)
  _$$ExpenseImplCopyWith<_$ExpenseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
