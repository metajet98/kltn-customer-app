import 'package:customer_app/generated/assets.gen.dart';
import 'package:customer_app/models/branch/branch.dart';
import 'package:customer_app/ui/base/base_view.dart';
import 'package:customer_app/ui/screen/branch_map/views/schedule/schedule_bottom_sheet_model.dart';
import 'package:customer_app/ui/screen/branch_map/views/schedule/schedule_item_view.dart';
import 'package:customer_app/ui/shared/list_view/easy_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ScheduleBottomSheet extends BaseView<ScheduleBottomSheetModel> {
  ScheduleBottomSheet(Branch branch) {
    viewModel.branch = branch;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 48),
            child: Material(
              borderRadius: BorderRadius.circular(32),
              color: Colors.white,
              elevation: 5,
              child: Container(
                padding: EdgeInsets.only(top: 48, right: 16, left: 16, bottom: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 8),
                    Text(
                      "Lịch sử đặt hẹn",
                      style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    Obx(
                      () => EasyListView(
                        primary: false,
                        shrinkWrap: true,
                        placeholderWidget: Container(
                          padding: EdgeInsets.all(16),
                          child: Text("Bạn chưa có lịch hẹn nào cả"),
                        ),
                        dividerBuilder: (ctx, index) => SizedBox(height: 8,),
                        itemCount: viewModel.calenders?.length ?? 0,
                        itemBuilder: (ctx, index) => ScheduleItemView(
                          calender: viewModel.calenders[index],
                          onDelete: viewModel.deleteSchedule,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Material(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
              color: Colors.white,
              child: ClipRRect(
                child: Container(
                  width: 96,
                  height: 96,
                  child: Hero(
                    tag: "ic_logo",
                    child: Assets.resources.images.icLogo.image(fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
