import 'package:flutter/material.dart';
import 'package:mobile1_flutter_coding_test/user/component/user_detail_dialog.dart';
import 'package:mobile1_flutter_coding_test/user/component/user_list_item.dart';
import 'package:mobile1_flutter_coding_test/user/repository/user_repository.dart';

class UserScreen extends StatelessWidget {
  final UserRepository _userRepository = UserRepository();

  UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _userRepository.getUsers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }

        final users = snapshot.data?.users ?? [];

        return ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return UserListItem(
              user: users[index],
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return UserDetailDialog(
                      user: users[index],
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
