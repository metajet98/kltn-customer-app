import 'package:customer_app/models/branch/branch.dart';
import 'package:customer_app/ui/screen/branch_map/views/calender/create_calender_bottom_sheet.dart';
import 'package:customer_app/ui/screen/branch_map/views/schedule/schedule_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class BranchDetailBottomSheet extends StatelessWidget {
  final Branch branch;

  const BranchDetailBottomSheet({Key key, this.branch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Chi nhánh: ${branch.name ?? ""}",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text("Địa chỉ: ${branch.address}"),
          SizedBox(height: 16),
          Image.network(branch.logo),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                color: Colors.blueAccent,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                onPressed: () => Get.bottomSheet(CreateCalenderBottomSheet(branch), isScrollControlled: true),
                child: Text(
                  "Đặt lịch hẹn",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(width: 16),
              FlatButton(
                color: Colors.blueAccent,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                onPressed: () => Get.bottomSheet(ScheduleBottomSheet(branch), isScrollControlled: true, enableDrag: true),
                child: Text(
                  "Lịch sử đặt hẹn",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
