import 'package:flutter/material.dart';
import 'package:mobile1_flutter_coding_test/common/component/common_image.dart';
import 'package:mobile1_flutter_coding_test/user/model/users_model.dart';

class UserListItem extends StatelessWidget {
  final UserModel user;
  final VoidCallback onTap;

  const UserListItem({
    super.key,
    required this.user,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CommonImage(
        imageUrl: user.profilePicture,
      ),
      title: Text(user.name),
      subtitle: Text(user.email),
      onTap: onTap,
    );
  }
}
