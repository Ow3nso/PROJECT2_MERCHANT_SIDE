// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExpenseImpl _$$ExpenseImplFromJson(Map<String, dynamic> json) =>
    _$ExpenseImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      category: $enumDecodeNullable(_$ExpenseCategoryEnumMap, json['category']),
      fromdate: json['fromDate'] == null
          ? null
          : DateTime.parse(json['fromDate'] as String),
      toDate: json['toDate'] == null
          ? null
          : DateTime.parse(json['toDate'] as String),
      amount: (json['amount'] as num?)?.toDouble(),
      note: json['note'] as String?,
      imageUrl: json['imageUrl'] as String?,
      description: json['description'] as String?,
      createdAt: DateUtils.timestampToDateTime(json['createAt'] as Timestamp?),
      updatedAt: DateUtils.timestampToDateTime(json['updateAt'] as Timestamp?),
      shopId: json['shopId'] as String?,
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$$ExpenseImplToJson(_$ExpenseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': _$ExpenseCategoryEnumMap[instance.category],
      'fromDate': instance.fromdate?.toIso8601String(),
      'toDate': instance.toDate?.toIso8601String(),
      'amount': instance.amount,
      'note': instance.note,
      'imageUrl': instance.imageUrl,
      'description': instance.description,
      'createAt': DateUtils.dateTimeToTimestamp(instance.createdAt),
      'updateAt': DateUtils.dateTimeToTimestamp(instance.updatedAt),
      'shopId': instance.shopId,
      'userId': instance.userId,
    };

const _$ExpenseCategoryEnumMap = {
  ExpenseCategory.stock: 'stock',
  ExpenseCategory.transport: 'transport',
  ExpenseCategory.events: 'events',
  ExpenseCategory.materials: 'materials',
  ExpenseCategory.production: 'production',
  ExpenseCategory.other: 'other',
};
