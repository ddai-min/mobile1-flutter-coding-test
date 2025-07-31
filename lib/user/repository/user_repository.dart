import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:mobile1_flutter_coding_test/user/model/users_model.dart';

class UserRepository {
  Future<UsersModel> getUsers() async {
    final jsonString = await rootBundle.loadString('api/users.json');

    final Map<String, dynamic> jsonList = json.decode(jsonString);

    return UsersModel.fromJson(jsonList);
  }
}
