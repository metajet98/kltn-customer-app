import 'package:customer_app/backend/services/maintenance_service.dart';
import 'package:customer_app/models/maintenance/review.dart';
import 'package:customer_app/ui/base/base_view_model.dart';
import 'package:customer_app/ui/screen/maintenance_detail/bottom_sheet/review/review_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:get/get.dart';

@injectable
class ReviewBottomSheetModel extends BaseViewModel<ReviewBottomSheet> {
  int maintenanceId;
  Review review;

  final MaintenanceService maintenanceService;

  final commentInputController = TextEditingController();

  ReviewBottomSheetModel(this.maintenanceService);

  double star = 0;
  String comment;

  @override
  void onInit() {
    commentInputController?.text = review?.comment;
    star = review?.star ?? 0;
    comment = review?.comment;
    super.onInit();
  }

  void submitReview() {
    if(!validate()) return;
    var params = <String, dynamic>{
      "star": star,
      "comment": comment,
    };
    print(params);
    call(() async {
      await maintenanceService.reviewMaintenance(maintenanceId: maintenanceId, params: params);
      Get.back(result: true);
    }, toastOnError: true, background: false);
  }

  bool validate() {
    if(star == 0) {
      Fluttertoast.showToast(msg: "Vui lòng chọn số điểm theo bậc sao 5!");
      return false;
    }
    return true;
  }
}
