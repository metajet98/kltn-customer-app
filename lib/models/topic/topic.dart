import 'package:customer_app/models/topic/topic_image.dart';
import 'package:customer_app/models/topic/topic_reply.dart';
import 'package:customer_app/models/user/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'topic.g.dart';

@JsonSerializable()
class Topic {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "userId")
  int userId;

  @JsonKey(name: "user")
  User user;

  @JsonKey(name: "email")
  String email;

  @JsonKey(name: "title")
  String title;

  @JsonKey(name: "content")
  String content;

  @JsonKey(name: "createdDate")
  DateTime createdDate;

  @JsonKey(name: "topicImage")
  List<TopicImage> topicImages;

  @JsonKey(name: "topicReply")
  List<TopicReply> topicReply;

  Topic({this.id, this.userId, this.user, this.email, this.title, this.content, this.createdDate, this.topicImages, this.topicReply});

  factory Topic.fromJson(Map<String, dynamic> json) => _$TopicFromJson(json);

  Map<String, dynamic> toJson() => _$TopicToJson(this);
}
