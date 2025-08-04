import 'package:flutter/material.dart';
import 'package:mobile1_flutter_coding_test/common/component/common_image.dart';
import 'package:mobile1_flutter_coding_test/room/model/rooms_model.dart';

class RoomListItem extends StatelessWidget {
  final RoomModel room;
  final VoidCallback onTap;

  const RoomListItem({
    super.key,
    required this.room,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CommonImage(
        imageUrl: room.thumbnailImage,
      ),
      title: Text(room.roomName),
      subtitle: Text(room.lastMessage?.content ?? ''),
      onTap: onTap,
    );
  }
}
