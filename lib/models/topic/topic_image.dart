import 'package:customer_app/models/user/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'topic_image.g.dart';

@JsonSerializable()
class TopicImage {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "image")
  String image;

  @JsonKey(name: "createdDate")
  DateTime createdDate;

  TopicImage({this.id, this.image, this.createdDate});

  factory TopicImage.fromJson(Map<String, dynamic> json) => _$TopicImageFromJson(json);

  Map<String, dynamic> toJson() => _$TopicImageToJson(this);
}
