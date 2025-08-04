import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile1_flutter_coding_test/room/model/rooms_model.dart';
import 'package:mobile1_flutter_coding_test/room/repository/room_repository.dart';

final _roomRepository = RoomRepository();

final getRoomListProvider = FutureProvider<RoomsModel>((ref) async {
  final roomList = await _roomRepository.getRooms();

  return roomList;
});
