import 'dart:async';

import 'package:customer_app/backend/services/vehicle_service.dart';
import 'package:customer_app/event_bus.dart';
import 'package:customer_app/events/event_my_bike_change.dart';
import 'package:customer_app/models/vehicle/vehicle.dart';
import 'package:customer_app/ui/base/base_view_model.dart';
import 'package:injectable/injectable.dart';
import 'package:get/get.dart';

@injectable
class MyBikesScreenModel extends BaseViewModel {
  final VehicleService vehicleService;

  MyBikesScreenModel(this.vehicleService);
  
  final _userVehicles = <Vehicle>[].obs;

  List<Vehicle> get userVehicles => _userVehicles.value;

  StreamSubscription onAddVehicleSuccessListener;
  
  @override
  void onInit() {
    loadVehicle();
    onAddVehicleSuccessListener = eventBus.on<EventMyBikeChange>().listen((_) => loadVehicle(showLoading: false));
    super.onInit();
  }

  @override
  void onDispose() {
    onAddVehicleSuccessListener?.cancel();
    super.onDispose();
  }
  
  Future loadVehicle({bool showLoading = true}) {
    return call(() async {
      final result = (await vehicleService.getUserVehicles()).data;
      _userVehicles.value = result;
      print(result.length);
    }, background: !showLoading, toastOnError: true);
  }
}