import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile1_flutter_coding_test/room/component/room_list_item.dart';
import 'package:mobile1_flutter_coding_test/room/repository/room_repository.dart';
import 'package:mobile1_flutter_coding_test/room/view/room_message_screen.dart';

class RoomScreen extends StatelessWidget {
  final RoomRepository _roomRepository = RoomRepository();

  RoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _roomRepository.getRooms(),
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

        final rooms = snapshot.data?.chatRooms ?? [];

        return ListView.builder(
          itemCount: rooms.length,
          itemBuilder: (context, index) {
            return RoomListItem(
              room: rooms[index],
              onTap: () {
                context.goNamed(
                  RoomMessageScreen.routeName,
                  pathParameters: {
                    'roomId': rooms[index].roomId,
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
