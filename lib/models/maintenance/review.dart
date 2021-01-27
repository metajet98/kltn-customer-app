import 'package:json_annotation/json_annotation.dart';

part 'review.g.dart';

@JsonSerializable()
class Review {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "star")
  double star;

  @JsonKey(name: "comment")
  String comment;


  Review({this.id, this.comment, this.star});

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}
