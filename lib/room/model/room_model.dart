import 'package:json_annotation/json_annotation.dart';
import 'package:mobile1_flutter_coding_test/room/model/message_model.dart';

part 'room_model.g.dart';

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
