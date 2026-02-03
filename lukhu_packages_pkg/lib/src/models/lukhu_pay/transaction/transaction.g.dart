// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionImpl _$$TransactionImplFromJson(Map<String, dynamic> json) =>
    _$TransactionImpl(
      createdAt: json['createdAt'] as String?,
      id: json['_id'] as String?,
      amount: _stringToDouble(json['amount']),
      currency: json['currency'] as String?,
      description: json['description'] as String?,
      status: json['status'] as String?,
      type: json['type'] as String?,
      updatedAt: (json['updatedAt'] as num?)?.toInt(),
      walletId: json['walletId'] as String?,
      transactionId: json['transactionId'] as String?,
      userId: json['userId'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
      imageUrl: json['imageUrl'] as String?,
      shopId: json['shopId'] as String?,
      newBalance: json['newBalance'] as String?,
      reference: _stringToDouble(json['reference']),
    );

Map<String, dynamic> _$$TransactionImplToJson(_$TransactionImpl instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      '_id': instance.id,
      'amount': instance.amount,
      'currency': instance.currency,
      'description': instance.description,
      'status': instance.status,
      'type': instance.type,
      'updatedAt': instance.updatedAt,
      'walletId': instance.walletId,
      'transactionId': instance.transactionId,
      'userId': instance.userId,
      'metadata': instance.metadata,
      'imageUrl': instance.imageUrl,
      'shopId': instance.shopId,
      'newBalance': instance.newBalance,
      'reference': instance.reference,
    };
