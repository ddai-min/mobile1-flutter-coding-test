import 'package:flutter/material.dart';
import 'package:mobile1_flutter_coding_test/common/component/common_image.dart';
import 'package:mobile1_flutter_coding_test/user/model/users_model.dart';

class UserDetailDialog extends StatelessWidget {
  final UserModel user;

  const UserDetailDialog({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CommonImage(
              imageUrl: user.profilePicture,
            ),
            const SizedBox(height: 16),
            Text(
              user.name,
            ),
            const SizedBox(height: 8),
            Text(user.email),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('닫기'),
            ),
          ],
        ),
      ),
    );
  }
}
