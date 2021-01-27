import 'package:customer_app/models/topic/topic_image.dart';
import 'package:customer_app/models/topic/topic_reply.dart';
import 'package:customer_app/models/user/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification.g.dart';

@JsonSerializable()
class Notification {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "activity")
  String activity;

  @JsonKey(name: "title")
  String title;

  @JsonKey(name: "description")
  String description;

  @JsonKey(name: "createdDate")
  DateTime createdDate;

  Notification(this.id, this.activity, this.title, this.description, this.createdDate);

  factory Notification.fromJson(Map<String, dynamic> json) => _$NotificationFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationToJson(this);
}
