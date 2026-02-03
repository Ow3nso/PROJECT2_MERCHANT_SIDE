// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WalletImpl _$$WalletImplFromJson(Map<String, dynamic> json) => _$WalletImpl(
      createdAt: DateUtils.timestampToDateTime(json['createdAt'] as Timestamp?),
      id: json['_id'] as String?,
      balance: (json['balance'] as num?)?.toDouble(),
      updatedAt: (json['updatedAt'] as num?)?.toInt(),
      availableBalance: (json['availableBalance'] as num?)?.toDouble(),
      pendingBalance: (json['pendingBalance'] as num?)?.toDouble(),
      currency: json['currency'] as String?,
      name: json['name'] as String?,
      shopId: json['shopId'] as String?,
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$$WalletImplToJson(_$WalletImpl instance) =>
    <String, dynamic>{
      'createdAt': DateUtils.dateTimeToTimestamp(instance.createdAt),
      '_id': instance.id,
      'balance': instance.balance,
      'updatedAt': instance.updatedAt,
      'availableBalance': instance.availableBalance,
      'pendingBalance': instance.pendingBalance,
      'currency': instance.currency,
      'name': instance.name,
      'shopId': instance.shopId,
      'userId': instance.userId,
    };
