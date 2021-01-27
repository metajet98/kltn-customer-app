import 'package:customer_app/backend/services/calender_service.dart';
import 'package:customer_app/locator.dart';
import 'package:customer_app/models/branch/branch.dart';
import 'package:customer_app/models/calender/calender.dart';
import 'package:customer_app/storage/user_storage.dart';
import 'package:customer_app/ui/base/base_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@injectable
class ScheduleBottomSheetModel extends BaseViewModel {
  Branch branch;

  final _calenders = RxList<Calender>();

  List<Calender> get calenders => _calenders.value;

  final CalenderService calenderService;

  ScheduleBottomSheetModel(this.calenderService);

  @override
  void onInit() {
    loadSchedule();
    super.onInit();
  }

  Future loadSchedule({bool showLoading = true}) async {
    return call(() async {
      var userId = locator<UserStorage>().get();
      var calenderFetchedList = (await calenderService.getCalender(userId: userId)).data;
      if(calenderFetchedList.isEmpty) {
        Fluttertoast.showToast(msg: "Bạn chưa có lịch hẹn nào cả!");
        Get.back();
        return;
      }
      _calenders.value = calenderFetchedList;
    }, background: !showLoading, toastOnError: true);
  }

  Future deleteSchedule(int id) async {
    return call(() async {
      await calenderService.deleteCalender(id: id);
      loadSchedule(showLoading: false);
    }, background: false, toastOnError: true);
  }
}
