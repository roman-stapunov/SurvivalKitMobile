import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(ignore: true)
  int id;
  String name;
  String email;
  String userName;
  String phoneNumber;
  String password;
  int roleName;

  User({
    this.id,
    this.name,
    this.email,
    this.userName,
    this.phoneNumber,
    this.password,
    this.roleName
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
