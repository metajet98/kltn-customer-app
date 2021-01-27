import 'package:customer_app/generated/assets.gen.dart';
import 'package:customer_app/models/branch/branch.dart';
import 'package:customer_app/ui/base/base_view.dart';
import 'package:customer_app/ui/screen/branch_map/views/calender/create_calender_bottom_sheet_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:date_time_picker/date_time_picker.dart';

class CreateCalenderBottomSheet extends BaseView<CreateCalenderBottomSheetModel> {
  CreateCalenderBottomSheet(Branch branch) {
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
                    Text(
                      "Đặt lịch hẹn",
                      style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      viewModel.branch?.name ?? "",
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                    SizedBox(height: 32),
                    DateTimePicker(
                      type: DateTimePickerType.dateTime,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(Duration(days: 365)),
                      onChanged: (value) {
                        viewModel.time = DateTime.tryParse(value);
                      },
                      decoration: InputDecoration(
                          labelText: "Thời gian",
                          border: new OutlineInputBorder(
                            gapPadding: 0,
                            borderRadius: const BorderRadius.all(const Radius.circular(20)),
                          ),
                          hintText: "Chọn thời gian",
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: viewModel.notesInputController,
                      decoration: InputDecoration(
                          labelText: "Ghi chú",
                          border: new OutlineInputBorder(
                            gapPadding: 0,
                            borderRadius: const BorderRadius.all(const Radius.circular(20)),
                          ),
                          hintText: "Nhập ghi chú",
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 14)),
                    ),
                    SizedBox(height: 16),
                    FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onPressed: () => viewModel.createCalender(),
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          "Tạo",
                          style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      color: Colors.green,
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
