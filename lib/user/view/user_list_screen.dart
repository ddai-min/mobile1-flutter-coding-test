import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile1_flutter_coding_test/user/component/user_detail_dialog.dart';
import 'package:mobile1_flutter_coding_test/user/component/user_list_item.dart';
import 'package:mobile1_flutter_coding_test/user/provider/user_provider.dart';

class UserListScreen extends ConsumerWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userList = ref.watch(getUserListProvider);

    return userList.when(
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      error: (error, stack) {
        return Center(
          child: Text('Error: $error'),
        );
      },
      data: (data) {
        final users = data.users;

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
