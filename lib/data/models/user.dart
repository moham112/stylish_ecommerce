import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String? name;
  String? email;
  String? password;
  String? avatar;

  User({this.name, this.email, this.password, this.avatar});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
