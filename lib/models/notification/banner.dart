import 'package:customer_app/models/topic/topic_image.dart';
import 'package:customer_app/models/topic/topic_reply.dart';
import 'package:customer_app/models/user/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'banner.g.dart';

@JsonSerializable()
class Banner {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "activity")
  String activity;

  @JsonKey(name: "description")
  String description;

  @JsonKey(name: "priority")
  int priority;

  @JsonKey(name: "image")
  String image;

  @JsonKey(name: "active")
  bool active;

  @JsonKey(name: "createdDate")
  DateTime createdDate;

  Banner(this.id, this.activity, this.description, this.priority, this.image, this.active, this.createdDate);

  factory Banner.fromJson(Map<String, dynamic> json) => _$BannerFromJson(json);

  Map<String, dynamic> toJson() => _$BannerToJson(this);
}
