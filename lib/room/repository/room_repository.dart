import 'package:mobile1_flutter_coding_test/common/repository/json_to_model.dart';
import 'package:mobile1_flutter_coding_test/room/model/messages_model.dart';
import 'package:mobile1_flutter_coding_test/room/model/rooms_model.dart';

class RoomRepository {
  Future<RoomsModel> getRooms() async {
    return await JsonToModel<RoomsModel>().toModel(
      key: 'api/rooms.json',
      fromJson: (json) => RoomsModel.fromJson(json),
    );
  }

  Future<MessagesModel> getMessages({
    required String roomId,
  }) async {
    final messageList = await JsonToModel<MessagesModel>().toModel(
      key: 'api/messages.json',
      fromJson: (json) => MessagesModel.fromJson(json),
    );

    return MessagesModel(
      messages: messageList.messages
          .where((message) => message.roomId == roomId)
          .toList(),
    );
  }
}
