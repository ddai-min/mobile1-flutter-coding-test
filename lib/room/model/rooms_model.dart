import 'package:json_annotation/json_annotation.dart';
import 'package:mobile1_flutter_coding_test/room/model/messages_model.dart';

part 'rooms_model.g.dart';

@JsonSerializable()
class RoomsModel {
  final List<RoomModel> chatRooms;

  RoomsModel({
    required this.chatRooms,
  });

  factory RoomsModel.fromJson(Map<String, dynamic> json) =>
      _$RoomsModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoomsModelToJson(this);
}

@JsonSerializable()
class RoomModel {
  final String roomId;
  final String roomName;
  final String creator;
  final List<String> participants;
  final DateTime createdAt;
  final MessageModel? lastMessage;
  final String thumbnailImage;

  RoomModel({
    required this.roomId,
    required this.roomName,
    required this.creator,
    required this.participants,
    required this.createdAt,
    this.lastMessage,
    required this.thumbnailImage,
  });

  factory RoomModel.fromJson(Map<String, dynamic> json) =>
      _$RoomModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoomModelToJson(this);
}
