import 'dart:async';

import 'package:customer_app/backend/services/vehicle_service.dart';
import 'package:customer_app/models/maintenance/schedule.dart';
import 'package:customer_app/ui/base/base_view_model.dart';
import 'package:injectable/injectable.dart';
import 'package:get/get.dart';

@injectable
class ScheduleScreenModel extends BaseViewModel {
  final VehicleService vehicleService;

  int userVehicleId;

  ScheduleScreenModel(this.vehicleService);
  
  final _schedule = <Schedule>[].obs;

  List<Schedule> get schedules => _schedule.value;

  @override
  void onInit() {
    loadSchedule();
    super.onInit();
  }
  
  Future loadSchedule({bool showLoading = true}) {
    return call(() async {
      _schedule.value = (await vehicleService.getUserVehicleSchedule(userVehicleId)).data;
    }, background: !showLoading, toastOnError: true);
  }
}