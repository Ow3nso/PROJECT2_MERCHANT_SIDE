// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_collection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ShopCollection _$ShopCollectionFromJson(Map<String, dynamic> json) {
  return _ShopCollection.fromJson(json);
}

/// @nodoc
mixin _$ShopCollection {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(
      name: ShopCollectionFields.createdAt,
      fromJson: DateUtils.timestampToDateTime,
      toJson: DateUtils.dateTimeToTimestamp)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: ShopCollectionFields.shopId)
  String? get shopId => throw _privateConstructorUsedError;
  @JsonKey(name: ShopCollectionFields.name)
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: ShopCollectionFields.userId)
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: ShopCollectionFields.docId)
  String? get docId => throw _privateConstructorUsedError;
  @JsonKey(name: ShopCollectionFields.productIds)
  List<String>? get productIds => throw _privateConstructorUsedError;
  @JsonKey(name: ShopCollectionFields.isPublic)
  bool? get isPublic => throw _privateConstructorUsedError;
  @JsonKey(name: ShopCollectionFields.updatedAt)
  int? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: ShopCollectionFields.views)
  int? get views => throw _privateConstructorUsedError;
  @JsonKey(name: ShopCollectionFields.link)
  String? get link => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShopCollectionCopyWith<ShopCollection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopCollectionCopyWith<$Res> {
  factory $ShopCollectionCopyWith(
          ShopCollection value, $Res Function(ShopCollection) then) =
      _$ShopCollectionCopyWithImpl<$Res, ShopCollection>;
  @useResult
  $Res call(
      {String? id,
      @JsonKey(
          name: ShopCollectionFields.createdAt,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
      DateTime? createdAt,
      @JsonKey(name: ShopCollectionFields.shopId) String? shopId,
      @JsonKey(name: ShopCollectionFields.name) String? name,
      @JsonKey(name: ShopCollectionFields.userId) String? userId,
      @JsonKey(name: ShopCollectionFields.docId) String? docId,
      @JsonKey(name: ShopCollectionFields.productIds) List<String>? productIds,
      @JsonKey(name: ShopCollectionFields.isPublic) bool? isPublic,
      @JsonKey(name: ShopCollectionFields.updatedAt) int? updatedAt,
      @JsonKey(name: ShopCollectionFields.views) int? views,
      @JsonKey(name: ShopCollectionFields.link) String? link});
}

/// @nodoc
class _$ShopCollectionCopyWithImpl<$Res, $Val extends ShopCollection>
    implements $ShopCollectionCopyWith<$Res> {
  _$ShopCollectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? shopId = freezed,
    Object? name = freezed,
    Object? userId = freezed,
    Object? docId = freezed,
    Object? productIds = freezed,
    Object? isPublic = freezed,
    Object? updatedAt = freezed,
    Object? views = freezed,
    Object? link = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      shopId: freezed == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      docId: freezed == docId
          ? _value.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String?,
      productIds: freezed == productIds
          ? _value.productIds
          : productIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isPublic: freezed == isPublic
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      views: freezed == views
          ? _value.views
          : views // ignore: cast_nullable_to_non_nullable
              as int?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShopCollectionImplCopyWith<$Res>
    implements $ShopCollectionCopyWith<$Res> {
  factory _$$ShopCollectionImplCopyWith(_$ShopCollectionImpl value,
          $Res Function(_$ShopCollectionImpl) then) =
      __$$ShopCollectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @JsonKey(
          name: ShopCollectionFields.createdAt,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
      DateTime? createdAt,
      @JsonKey(name: ShopCollectionFields.shopId) String? shopId,
      @JsonKey(name: ShopCollectionFields.name) String? name,
      @JsonKey(name: ShopCollectionFields.userId) String? userId,
      @JsonKey(name: ShopCollectionFields.docId) String? docId,
      @JsonKey(name: ShopCollectionFields.productIds) List<String>? productIds,
      @JsonKey(name: ShopCollectionFields.isPublic) bool? isPublic,
      @JsonKey(name: ShopCollectionFields.updatedAt) int? updatedAt,
      @JsonKey(name: ShopCollectionFields.views) int? views,
      @JsonKey(name: ShopCollectionFields.link) String? link});
}

/// @nodoc
class __$$ShopCollectionImplCopyWithImpl<$Res>
    extends _$ShopCollectionCopyWithImpl<$Res, _$ShopCollectionImpl>
    implements _$$ShopCollectionImplCopyWith<$Res> {
  __$$ShopCollectionImplCopyWithImpl(
      _$ShopCollectionImpl _value, $Res Function(_$ShopCollectionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? shopId = freezed,
    Object? name = freezed,
    Object? userId = freezed,
    Object? docId = freezed,
    Object? productIds = freezed,
    Object? isPublic = freezed,
    Object? updatedAt = freezed,
    Object? views = freezed,
    Object? link = freezed,
  }) {
    return _then(_$ShopCollectionImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      shopId: freezed == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      docId: freezed == docId
          ? _value.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String?,
      productIds: freezed == productIds
          ? _value._productIds
          : productIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isPublic: freezed == isPublic
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      views: freezed == views
          ? _value.views
          : views // ignore: cast_nullable_to_non_nullable
              as int?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ShopCollectionImpl implements _ShopCollection {
  _$ShopCollectionImpl(
      {this.id,
      @JsonKey(
          name: ShopCollectionFields.createdAt,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
      this.createdAt,
      @JsonKey(name: ShopCollectionFields.shopId) this.shopId,
      @JsonKey(name: ShopCollectionFields.name) this.name,
      @JsonKey(name: ShopCollectionFields.userId) this.userId,
      @JsonKey(name: ShopCollectionFields.docId) this.docId,
      @JsonKey(name: ShopCollectionFields.productIds)
      final List<String>? productIds,
      @JsonKey(name: ShopCollectionFields.isPublic) this.isPublic,
      @JsonKey(name: ShopCollectionFields.updatedAt) this.updatedAt,
      @JsonKey(name: ShopCollectionFields.views) this.views,
      @JsonKey(name: ShopCollectionFields.link) this.link})
      : _productIds = productIds;

  factory _$ShopCollectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShopCollectionImplFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(
      name: ShopCollectionFields.createdAt,
      fromJson: DateUtils.timestampToDateTime,
      toJson: DateUtils.dateTimeToTimestamp)
  final DateTime? createdAt;
  @override
  @JsonKey(name: ShopCollectionFields.shopId)
  final String? shopId;
  @override
  @JsonKey(name: ShopCollectionFields.name)
  final String? name;
  @override
  @JsonKey(name: ShopCollectionFields.userId)
  final String? userId;
  @override
  @JsonKey(name: ShopCollectionFields.docId)
  final String? docId;
  final List<String>? _productIds;
  @override
  @JsonKey(name: ShopCollectionFields.productIds)
  List<String>? get productIds {
    final value = _productIds;
    if (value == null) return null;
    if (_productIds is EqualUnmodifiableListView) return _productIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: ShopCollectionFields.isPublic)
  final bool? isPublic;
  @override
  @JsonKey(name: ShopCollectionFields.updatedAt)
  final int? updatedAt;
  @override
  @JsonKey(name: ShopCollectionFields.views)
  final int? views;
  @override
  @JsonKey(name: ShopCollectionFields.link)
  final String? link;

  @override
  String toString() {
    return 'ShopCollection(id: $id, createdAt: $createdAt, shopId: $shopId, name: $name, userId: $userId, docId: $docId, productIds: $productIds, isPublic: $isPublic, updatedAt: $updatedAt, views: $views, link: $link)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShopCollectionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.shopId, shopId) || other.shopId == shopId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.docId, docId) || other.docId == docId) &&
            const DeepCollectionEquality()
                .equals(other._productIds, _productIds) &&
            (identical(other.isPublic, isPublic) ||
                other.isPublic == isPublic) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.views, views) || other.views == views) &&
            (identical(other.link, link) || other.link == link));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdAt,
      shopId,
      name,
      userId,
      docId,
      const DeepCollectionEquality().hash(_productIds),
      isPublic,
      updatedAt,
      views,
      link);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShopCollectionImplCopyWith<_$ShopCollectionImpl> get copyWith =>
      __$$ShopCollectionImplCopyWithImpl<_$ShopCollectionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShopCollectionImplToJson(
      this,
    );
  }
}

abstract class _ShopCollection implements ShopCollection {
  factory _ShopCollection(
          {final String? id,
          @JsonKey(
              name: ShopCollectionFields.createdAt,
              fromJson: DateUtils.timestampToDateTime,
              toJson: DateUtils.dateTimeToTimestamp)
          final DateTime? createdAt,
          @JsonKey(name: ShopCollectionFields.shopId) final String? shopId,
          @JsonKey(name: ShopCollectionFields.name) final String? name,
          @JsonKey(name: ShopCollectionFields.userId) final String? userId,
          @JsonKey(name: ShopCollectionFields.docId) final String? docId,
          @JsonKey(name: ShopCollectionFields.productIds)
          final List<String>? productIds,
          @JsonKey(name: ShopCollectionFields.isPublic) final bool? isPublic,
          @JsonKey(name: ShopCollectionFields.updatedAt) final int? updatedAt,
          @JsonKey(name: ShopCollectionFields.views) final int? views,
          @JsonKey(name: ShopCollectionFields.link) final String? link}) =
      _$ShopCollectionImpl;

  factory _ShopCollection.fromJson(Map<String, dynamic> json) =
      _$ShopCollectionImpl.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(
      name: ShopCollectionFields.createdAt,
      fromJson: DateUtils.timestampToDateTime,
      toJson: DateUtils.dateTimeToTimestamp)
  DateTime? get createdAt;
  @override
  @JsonKey(name: ShopCollectionFields.shopId)
  String? get shopId;
  @override
  @JsonKey(name: ShopCollectionFields.name)
  String? get name;
  @override
  @JsonKey(name: ShopCollectionFields.userId)
  String? get userId;
  @override
  @JsonKey(name: ShopCollectionFields.docId)
  String? get docId;
  @override
  @JsonKey(name: ShopCollectionFields.productIds)
  List<String>? get productIds;
  @override
  @JsonKey(name: ShopCollectionFields.isPublic)
  bool? get isPublic;
  @override
  @JsonKey(name: ShopCollectionFields.updatedAt)
  int? get updatedAt;
  @override
  @JsonKey(name: ShopCollectionFields.views)
  int? get views;
  @override
  @JsonKey(name: ShopCollectionFields.link)
  String? get link;
  @override
  @JsonKey(ignore: true)
  _$$ShopCollectionImplCopyWith<_$ShopCollectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
