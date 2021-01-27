import 'package:customer_app/ui/base/base_view.dart';
import 'package:customer_app/ui/screen/my_bikes/bottom_sheet/add_bike/add_bike_bottom_sheet.dart';
import 'package:customer_app/ui/screen/my_bikes/my_bikes_screen_model.dart';
import 'package:customer_app/ui/screen/my_bikes/views/my_bike_item_view.dart';
import 'package:customer_app/ui/screen/schedule/shedule_screen_model.dart';
import 'package:customer_app/ui/screen/schedule/views/schedule_view.dart';
import 'package:customer_app/ui/shared/list_view/easy_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

class ScheduleScreen extends BaseView<ScheduleScreenModel> {
  final int userVehicleId;

  ScheduleScreen({this.userVehicleId}) {
    viewModel.userVehicleId = userVehicleId;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          "Lịch hẹn",
          style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () => viewModel.loadSchedule(showLoading: false),
        child: Obx(
          () => EasyListView(
            itemCount: viewModel.schedules?.length ?? 0,
            padding: EdgeInsets.all(16),
            placeholderWidget: Center(child: Text("Bạn chưa có lịch hẹn nào đối với xe này cả!")),
            itemBuilder: (ctx, index) => ScheduleView(schedule: viewModel.schedules[index]),
            dividerBuilder: (ctx, index) => SizedBox(height: 16),
          ),
        ),
      ),
    );
  }
}
