import 'package:customer_app/backend/services/calender_service.dart';
import 'package:customer_app/models/branch/branch.dart';
import 'package:customer_app/ui/base/base_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreateCalenderBottomSheetModel extends BaseViewModel {
  Branch branch;

  DateTime time;

  final notesInputController = TextEditingController();

  final CalenderService calenderService;

  CreateCalenderBottomSheetModel(this.calenderService);

  void createCalender() {
    var params = <String, dynamic> {
      "Notes": notesInputController.text,
      "BranchId": branch.id,
      "Time": time.toIso8601String(),
    };
    call(() async {
      await calenderService.createCalender(params: params);
      Fluttertoast.showToast(msg: "Tạo lịch hẹn thành công!");
      Get.back();
    }, toastOnError: true, background: false);
  }
}