import 'package:json_annotation/json_annotation.dart';
import 'package:mobile1_flutter_coding_test/conference/model/message_model.dart';

part 'conference_model.g.dart';

@JsonSerializable()
class ConferenceModel {
  final String roomId;
  final String roomName;
  final String creator;
  final List<String> participants;
  final DateTime createdAt;
  final MessageModel? lastMessage;
  final String thumbnailImage;

  ConferenceModel({
    required this.roomId,
    required this.roomName,
    required this.creator,
    required this.participants,
    required this.createdAt,
    this.lastMessage,
    required this.thumbnailImage,
  });

  factory ConferenceModel.fromJson(Map<String, dynamic> json) =>
      _$ConferenceModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConferenceModelToJson(this);
}
