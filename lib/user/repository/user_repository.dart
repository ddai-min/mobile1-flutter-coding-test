import 'package:mobile1_flutter_coding_test/common/repository/json_to_model.dart';
import 'package:mobile1_flutter_coding_test/user/model/users_model.dart';

class UserRepository {
  Future<UsersModel> getUsers() async {
    return await JsonToModel<UsersModel>().toModel(
      key: 'api/users.json',
      fromJson: (json) => UsersModel.fromJson(json),
    );
  }
}
