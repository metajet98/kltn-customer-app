import 'package:customer_app/backend/services/maintenance_service.dart';
import 'package:customer_app/backend/services/vehicle_service.dart';
import 'package:customer_app/models/maintenance/maintenance.dart';
import 'package:customer_app/models/vehicle/vehicle.dart';
import 'package:customer_app/ui/base/base_view_model.dart';
import 'package:customer_app/ui/screen/my_bike_detail/my_bike_detail_screen.dart';
import 'package:injectable/injectable.dart';
import 'package:get/get.dart';

@injectable
class MyBikeDetailScreenModel extends BaseViewModel<MyBikeDetailScreen> {
  int userVehicleId;

  final VehicleService vehicleService;
  final MaintenanceService maintenanceService;

  final _userVehicle = Vehicle().obs;
  final _maintenances = RxList<Maintenance>();

  Vehicle get userVehicle => _userVehicle.value;
  List<Maintenance> get maintenances => _maintenances.value;

  MyBikeDetailScreenModel(this.vehicleService, this.maintenanceService);

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  Future loadData({bool showLoading = true}) {
    return call(() async {
      _userVehicle.value = (await vehicleService.getUserVehicle(userVehicleId)).data;
      _maintenances.assignAll((await maintenanceService.getAllMaintenance(userVehicleId: userVehicleId)).data);
    }, background: !showLoading, toastOnError: true);
  }
}
