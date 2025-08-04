import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile1_flutter_coding_test/room/component/room_list_item.dart';
import 'package:mobile1_flutter_coding_test/room/provider/room_provider.dart';
import 'package:mobile1_flutter_coding_test/room/view/room_screen.dart';

class RoomListScreen extends ConsumerWidget {
  const RoomListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final roomList = ref.watch(getRoomListProvider);

    return roomList.when(
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
        final rooms = data.chatRooms;

        return ListView.builder(
          itemCount: rooms.length,
          itemBuilder: (context, index) {
            return RoomListItem(
              room: rooms[index],
              onTap: () {
                context.goNamed(
                  RoomScreen.routeName,
                  pathParameters: {
                    'id': rooms[index].roomId,
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
