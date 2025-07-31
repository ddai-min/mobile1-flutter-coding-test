import 'package:mobile1_flutter_coding_test/common/repository/json_to_model.dart';
import 'package:mobile1_flutter_coding_test/room/model/rooms_model.dart';

class RoomRepository {
  Future<RoomsModel> getRooms() async {
    return await JsonToModel<RoomsModel>().toModel(
      key: 'api/rooms.json',
      fromJson: (json) => RoomsModel.fromJson(json),
    );
  }
}
