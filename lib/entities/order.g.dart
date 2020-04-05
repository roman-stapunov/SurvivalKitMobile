// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) {
  return Order()
    ..name = json['name'] as String
    ..id = json['id'] as int
    ..customerId = json['customerId'] as int
    ..count = json['count'] as int
    ..helperId = json['helperId'] as int
    ..serviceId = json['serviceId'] as int
    ..rewardCoins = json['rewardCoins'] as int
    ..secretCode = json['secretCode'] as String
    ..status = json['status'] as int;
}

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'customerId': instance.customerId,
      'count': instance.count,
      'helperId': instance.helperId,
      'serviceId': instance.serviceId,
      'rewardCoins': instance.rewardCoins,
      'secretCode': instance.secretCode,
      'status': instance.status,
    };
