import 'package:customer_app/models/branch/branch.dart';
import 'package:json_annotation/json_annotation.dart';

part 'calender.g.dart';

@JsonSerializable()
class Calender {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "userId")
  int userId;

  @JsonKey(name: "notes")
  String notes;

  @JsonKey(name: "time")
  DateTime time;

  @JsonKey(name: "branchId")
  int branchId;

  @JsonKey(name: "branch")
  Branch branch;

  @JsonKey(name: "status")
  int status;

  @JsonKey(name: "review")
  String review;

  @JsonKey(name: "createdDate")
  DateTime createdDate;

  Calender(this.id, this.userId, this.notes, this.time, this.branchId, this.branch, this.createdDate, this.review, this.status);

  factory Calender.fromJson(Map<String, dynamic> json) => _$CalenderFromJson(json);

  Map<String, dynamic> toJson() => _$CalenderToJson(this);
}
