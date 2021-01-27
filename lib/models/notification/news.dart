import 'package:customer_app/models/topic/topic_image.dart';
import 'package:customer_app/models/topic/topic_reply.dart';
import 'package:customer_app/models/user/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';

@JsonSerializable()
class News {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "thumbnail")
  String thumbnail;

  @JsonKey(name: "title")
  String title;

  @JsonKey(name: "url")
  String url;

  @JsonKey(name: "createdDate")
  DateTime createdDate;

  News(this.id, this.thumbnail, this.title, this.url, this.createdDate);

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  Map<String, dynamic> toJson() => _$NewsToJson(this);
}
