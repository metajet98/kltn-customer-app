import 'package:customer_app/constaints/constaints.dart';
import 'package:customer_app/helpers/format_helper.dart';
import 'package:customer_app/ui/base/base_view.dart';
import 'package:customer_app/ui/screen/maintenance_detail/bottom_sheet/review/review_bottom_sheet.dart';
import 'package:customer_app/ui/screen/maintenance_detail/maintenance_detail_screen_model.dart';
import 'package:customer_app/ui/screen/maintenance_detail/views/bill_table_view.dart';
import 'package:customer_app/ui/screen/maintenance_detail/views/maintenance_images_view.dart';
import 'package:customer_app/ui/screen/maintenance_detail/views/sparepart_result_item_view.dart';
import 'package:customer_app/ui/shared/list_view/easy_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MaintenanceDetailScreen extends BaseView<MaintenanceDetailScreenModel> {
  MaintenanceDetailScreen({int maintenanceId}) {
    viewModel.maintenanceId = maintenanceId;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: true,
        title: Text(
          "Chi tiết lượt bảo dưỡng",
          style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        actions: [
          Obx(
            () => Visibility(
              visible: viewModel.maintenance?.status == maintenanceFinish,
              child: IconButton(
                icon: Icon(
                  Icons.rate_review_outlined,
                  color: Colors.black,
                ),
                onPressed: () => viewModel.openReview(),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: () => viewModel.loadData(showLoading: false),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() => buildInfo(
                          Icons.person,
                          "Nhân viên: ${viewModel.maintenance?.receptionStaff?.fullName ?? ""}",
                        )),
                    Obx(() => buildInfo(
                          Icons.map,
                          "Chi nhánh: ${viewModel.maintenance?.branch?.name ?? ""}",
                        )),
                    Obx(() => buildInfo(
                          Icons.access_time,
                          "Thời gian nhận xe: ${FormatHelper.formatDateTime(viewModel.maintenance?.createdDate)}",
                        )),
                    Obx(() => buildInfo(
                          Icons.refresh,
                          "Đồng hồ: ${viewModel.maintenance?.odometer ?? ""} km",
                        )),
                    SizedBox(height: 16),
                    Text("Ghi chú", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Obx(
                      () => TextField(
                        minLines: 3,
                        maxLines: 20,
                        enabled: false,
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          hintText: viewModel.maintenance?.notes,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text("Kết quả kiểm tra", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                  ],
                ),
              ),
              Obx(
                () => EasyListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.only(left: 16, right: 16),
                  itemCount: viewModel.maintenance?.sparePartCheckDetail?.length ?? 0,
                  dividerBuilder: (ctx, index) => Divider(
                    color: Colors.grey,
                  ),
                  itemBuilder: (ctx, index) => SparePartResultItemView(
                    sparePartDetail: viewModel.maintenance?.sparePartCheckDetail[index],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Obx(() => Text("Tổng chi phí ${FormatHelper.formatMoney(viewModel.totalPrice)}",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
              ),
              Obx(
                () => Padding(padding: EdgeInsets.all(16), child: BillTableView(billDetails: viewModel.maintenance?.maintenanceBillDetail)),
              ),
              Obx(() => Visibility(
                    child: MaintenanceImageView(images: viewModel.maintenance?.maintenanceImages),
                    visible: !GetUtils.isNullOrBlank(viewModel.maintenance?.maintenanceImages),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfo(IconData iconData, String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
      child: Row(
        children: [
          Icon(iconData),
          SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(fontSize: 16, color: Colors.black),
          )
        ],
      ),
    );
  }
}
