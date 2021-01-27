import 'package:customer_app/models/user/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'topic_reply.g.dart';

@JsonSerializable()
class TopicReply {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "userId")
  int userId;

  @JsonKey(name: "user")
  User user;

  @JsonKey(name: "content")
  String content;

  @JsonKey(name: "image")
  String image;

  @JsonKey(name: "createdDate")
  DateTime createdDate;

  TopicReply({this.id, this.userId, this.user, this.content, this.image, this.createdDate});

  factory TopicReply.fromJson(Map<String, dynamic> json) => _$TopicReplyFromJson(json);

  Map<String, dynamic> toJson() => _$TopicReplyToJson(this);
}
