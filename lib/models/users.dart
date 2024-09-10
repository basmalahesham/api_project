import 'package:json_annotation/json_annotation.dart';

part 'users.g.dart';
@JsonSerializable()
class Users{
  int? id;
  String? name;
  String? email;
  String? gender;
  String? status;

  Users({this.id, this.name, this.email, this.gender, this.status});

  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UsersToJson(this);
}