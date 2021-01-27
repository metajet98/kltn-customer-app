import 'package:customer_app/backend/services/maintenance_service.dart';
import 'package:customer_app/ui/base/base_view_model.dart';
import 'package:customer_app/ui/screen/maintenance_detail/bottom_sheet/review/review_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:get/get.dart';

@injectable
class ReviewBottomSheetModel extends BaseViewModel<ReviewBottomSheet> {
  int maintenanceId;

  final MaintenanceService maintenanceService;

  final commentInputController = TextEditingController();

  ReviewBottomSheetModel(this.maintenanceService);

  double star = 0;
  String comment;

  void submitReview() {
    print("star: $star");
    var params = <String, dynamic>{
      "star": star,
      "comment": comment,
    };
    print(params);
    call(() async {
      await maintenanceService.reviewMaintenance(maintenanceId: maintenanceId, params: params);
      Get.back();
    }, toastOnError: true, background: false);
  }
}
