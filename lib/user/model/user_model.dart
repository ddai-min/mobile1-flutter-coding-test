import 'package:json_annotation/json_annotation.dart';
import 'package:mobile1_flutter_coding_test/user/enum/user_role.dart';
import 'package:mobile1_flutter_coding_test/user/enum/user_status.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String userId;
  final String name;
  final String email;
  final String profilePicture;
  final UserStatus status;
  final UserRole role;

  UserModel({
    required this.userId,
    required this.name,
    required this.email,
    required this.profilePicture,
    required this.status,
    required this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
