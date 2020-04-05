import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  String name;
  int id;
  int customerId;
  int count;
  int helperId;
  int serviceId;
  int rewardCoins;
  String secretCode;
  int status;

  Order();

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
