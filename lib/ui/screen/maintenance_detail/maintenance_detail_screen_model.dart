import 'package:customer_app/backend/services/maintenance_service.dart';
import 'package:customer_app/models/maintenance/maintenance.dart';
import 'package:customer_app/ui/base/base_view_model.dart';
import 'package:customer_app/ui/screen/maintenance_detail/maintenance_detail_screen.dart';
import 'package:injectable/injectable.dart';
import 'package:get/get.dart';

@injectable
class MaintenanceDetailScreenModel extends BaseViewModel<MaintenanceDetailScreen> {
  int maintenanceId;

  final MaintenanceService maintenanceService;

  MaintenanceDetailScreenModel(this.maintenanceService);

  final _maintenance = Maintenance().obs;

  Maintenance get maintenance => _maintenance.value;

  int get totalPrice {
    var result = 0;
    maintenance?.maintenanceBillDetail?.forEach((element) {
      result += element?.totalPrice;
    });
    return result;
  }


  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  Future loadData({bool showLoading = true}) async {
    return call(() async {
      _maintenance.value = (await maintenanceService.getMaintenance(maintenanceId: maintenanceId)).data;
    }, background: !showLoading);
  }
}