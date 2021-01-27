import 'package:json_annotation/json_annotation.dart';

part 'maintenance_image.g.dart';

@JsonSerializable()
class MaintenanceImage {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "imageUrl")
  String imageUrl;

  MaintenanceImage({this.id, this.imageUrl});

  factory MaintenanceImage.fromJson(Map<String, dynamic> json) => _$MaintenanceImageFromJson(json);

  Map<String, dynamic> toJson() => _$MaintenanceImageToJson(this);
}
