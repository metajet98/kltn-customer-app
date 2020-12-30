import 'package:customer_app/ui/base/base_view.dart';
import 'package:customer_app/ui/screen/my_bike_detail/my_bike_detail_screen_model.dart';
import 'package:customer_app/ui/screen/my_bike_detail/views/maintenance_history_item_view.dart';
import 'package:customer_app/ui/shared/list_view/easy_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

class MyBikeDetailScreen extends BaseView<MyBikeDetailScreenModel> {
  MyBikeDetailScreen({int userVehicleId}) {
    print(userVehicleId);
    viewModel.userVehicleId = userVehicleId;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: true,
        title: Obx(() => Text(
              viewModel.userVehicle?.name ?? viewModel.userVehicle?.vehicleGroup?.name ?? "Thông tin xe",
              style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
            )),
        actions: [IconButton(icon: Icon(FontAwesome.bell, color: Colors.grey), onPressed: () {})],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  "Thông số",
                  style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Obx(
                      () => Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            viewModel.userVehicle?.vehicleGroup?.image ?? "",
                            width: Get.width / 2 - 64,
                            height: Get.width / 2 - 64,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 32),
                    Obx(
                      () => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Dòng xe: ${viewModel.userVehicle?.vehicleGroup?.name ?? ""}"),
                          SizedBox(height: 4),
                          Text("Màu: ${viewModel.userVehicle?.color ?? ""}"),
                          SizedBox(height: 2),
                          Text("Biển số: ${viewModel.userVehicle?.plateNumber ?? ""}"),
                          SizedBox(height: 2),
                          Text("Số khung: ${viewModel.userVehicle?.chassisNumber ?? ""}"),
                          SizedBox(height: 2),
                          Text("Số máy: ${viewModel.userVehicle?.engineNumber ?? ""}"),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Icon(FontAwesome.history),
                    SizedBox(width: 4),
                    Text(
                      "Lịch sử bảo dưỡng",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Obx(
            () => Expanded(
              child: EasyListView(
                padding: EdgeInsets.all(16),
                itemCount: viewModel.maintenances?.length ?? 0,
                itemBuilder: (ctx, index) => MaintenanceHistoryItemView(maintenance: viewModel.maintenances[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
