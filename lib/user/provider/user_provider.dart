import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile1_flutter_coding_test/user/model/users_model.dart';
import 'package:mobile1_flutter_coding_test/user/repository/user_repository.dart';

final _userRepository = UserRepository();

final getUserListProvider = FutureProvider<UsersModel>((ref) async {
  final userList = await _userRepository.getUsers();

  return userList;
});
