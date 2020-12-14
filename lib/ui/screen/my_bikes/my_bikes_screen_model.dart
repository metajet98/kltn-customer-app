import 'dart:async';

import 'package:customer_app/backend/services/vehicle_service.dart';
import 'package:customer_app/event_bus.dart';
import 'package:customer_app/events/event_add_bike_success.dart';
import 'package:customer_app/models/vehicle/vehicle.dart';
import 'package:customer_app/ui/base/base_view_model.dart';
import 'package:injectable/injectable.dart';
import 'package:get/get.dart';

@injectable
class MyBikesScreenModel extends BaseViewModel {
  final VehicleService vehicleService;

  MyBikesScreenModel(this.vehicleService);
  
  final _userVehicles = <Vehicle>[].obs;

  StreamSubscription onAddVehicleSuccessListener;
  
  @override
  void onInit() {
    loadVehicle();
    onAddVehicleSuccessListener = eventBus.on<EventAddBikeSuccess>().listen((_) => loadVehicle(showLoading: false));
    super.onInit();
  }

  @override
  void onDispose() {
    onAddVehicleSuccessListener?.cancel();
    super.onDispose();
  }
  
  void loadVehicle({bool showLoading = true}) {
    call(() async {
      _userVehicles.assignAll((await vehicleService.getUserVehicle()).data);
    }, background: !showLoading, toastOnError: true);
  }
}