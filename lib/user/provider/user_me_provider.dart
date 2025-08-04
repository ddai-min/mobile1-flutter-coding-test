import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile1_flutter_coding_test/user/enum/user_role.dart';
import 'package:mobile1_flutter_coding_test/user/enum/user_status.dart';
import 'package:mobile1_flutter_coding_test/user/model/users_model.dart';

final userMeProvider = Provider<UserModel>((ref) {
  return UserModel(
    userId: 'user11',
    name: 'TM Kwon',
    email: 'yoda3708@gmail.com',
    profilePicture: 'https://picsum.photos/id/1020/200/200',
    status: UserStatus.online,
    role: UserRole.member,
  );
});
