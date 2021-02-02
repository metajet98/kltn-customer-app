import 'package:customer_app/backend/services/vehicle_service.dart';
import 'package:customer_app/event_bus.dart';
import 'package:customer_app/events/event_my_bike_change.dart';
import 'package:customer_app/models/vehicle/vehicle_company.dart';
import 'package:customer_app/models/vehicle/vehicle_group.dart';
import 'package:customer_app/models/vehicle/vehicle_type.dart';
import 'package:customer_app/ui/base/base_view_model.dart';
import 'package:customer_app/ui/screen/my_bikes/bottom_sheet/add_bike/add_bike_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:get/get.dart';

@injectable
class AddBikeBottomSheetModel extends BaseViewModel<AddBikeBottomSheet> {
  final VehicleService vehicleService;

  final _companies = <VehicleCompany>[].obs;
  final _vehicleTypes = <VehicleType>[].obs;
  final _vehicleGroups = <VehicleGroup>[].obs;

  List<VehicleCompany> get companies => _companies.value;

  List<VehicleType> get vehicleTypes => _vehicleTypes.value;

  List<VehicleGroup> get vehicleGroups => _vehicleGroups.value;

  int selectedGroupId;
  int selectedCompanyId;
  int selectedTypeId;
  String selectedColor;

  final chassisNumberInputController = TextEditingController();
  final engineNumberInputController = TextEditingController();
  final plateNumberInputController = TextEditingController();

  AddBikeBottomSheetModel(this.vehicleService);

  @override
  void onInit() {
    _loadData();
    super.onInit();
  }

  void _loadData() {
    call(() async {
      _companies.assignAll((await vehicleService.getVehicleCompanies()).data);
      _vehicleTypes.assignAll((await vehicleService.getVehicleTypes()).data);
    }, background: false, toastOnError: true);
  }

  void onSelectVehicleGroup(int vehicleTypeId) {
    call(() async {
      _vehicleGroups.assignAll((await vehicleService.getVehicleGroups(vehicleCompanyId: selectedCompanyId, vehicleTypeId: vehicleTypeId)).data);
    }, background: false, toastOnError: true);
  }

  void createBike() {
    var params = <String, dynamic>{
      "vehicleGroupId": selectedGroupId,
      "chassisNumber": chassisNumberInputController.text,
      "engineNumber": engineNumberInputController.text,
      "plateNumber": plateNumberInputController.text,
      "color": selectedColor
    };
    print(params);
    call(() async {
      await vehicleService.createUserVehicle(params: params);
      Get.back();
      eventBus.fire(EventMyBikeChange());
    }, toastOnError: true, background: false);
  }
}
