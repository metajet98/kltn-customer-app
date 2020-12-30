import 'package:customer_app/models/branch/branch.dart';
import 'package:customer_app/models/maintenance/bill_detail.dart';
import 'package:customer_app/models/maintenance/sparepart_detail.dart';
import 'package:customer_app/models/user/user.dart';
import 'package:customer_app/models/vehicle/vehicle.dart';
import 'package:json_annotation/json_annotation.dart';

part 'maintenance.g.dart';

@JsonSerializable()
class Maintenance {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "userVehicleId")
  int userVehicleId;

  @JsonKey(name: "userVehicle")
  Vehicle userVehicle;

  @JsonKey(name: "notes")
  String notes;

  @JsonKey(name: "maintenanceStaffId")
  int maintenanceStaffId;

  @JsonKey(name: "maintenanceStaff")
  User maintenanceStaff;

  @JsonKey(name: "receptionStaffId")
  int receptionStaffId;

  @JsonKey(name: "receptionStaff")
  User receptionStaff;

  @JsonKey(name: "odometer")
  int odometer;

  @JsonKey(name: "branch")
  Branch branch;

  @JsonKey(name: "createdDate")
  DateTime createdDate;

  @JsonKey(name: "modifyDate")
  DateTime modifyDate;

  @JsonKey(name: "maintenanceBillDetail")
  List<BillDetail> maintenanceBillDetail;

  @JsonKey(name: "sparepartCheckDetail")
  List<SparePartDetail> sparePartCheckDetail;

  Maintenance(
      {this.id,
      this.userVehicleId,
      this.userVehicle,
      this.notes,
      this.maintenanceStaffId,
      this.maintenanceStaff,
      this.receptionStaffId,
      this.receptionStaff,
      this.odometer,
      this.branch,
      this.createdDate,
      this.modifyDate});

  factory Maintenance.fromJson(Map<String, dynamic> json) => _$MaintenanceFromJson(json);

  Map<String, dynamic> toJson() => _$MaintenanceToJson(this);
}
