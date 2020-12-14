import 'package:json_annotation/json_annotation.dart';

part 'vehicle_group.g.dart';

@JsonSerializable()
class VehicleGroup {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "Capacity")
  int capacity;

  @JsonKey(name: "name")
  String name;

  @JsonKey(name: "logo")
  String logo;

  @JsonKey(name: "Image")
  String Image;


  VehicleGroup(this.id, this.capacity, this.name, this.logo, this.Image);

  factory VehicleGroup.fromJson(Map<String, dynamic> json) => _$VehicleGroupFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleGroupToJson(this);
}
