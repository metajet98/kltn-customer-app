import 'package:customer_app/ui/base/base_view.dart';
import 'package:customer_app/ui/screen/my_bikes/bottom_sheet/add_bike/add_bike_bottom_sheet.dart';
import 'package:customer_app/ui/screen/my_bikes/my_bikes_screen_model.dart';
import 'package:customer_app/ui/screen/my_bikes/views/my_bike_item_view.dart';
import 'package:customer_app/ui/shared/list_view/easy_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

class MyBikesScreen extends BaseView<MyBikesScreenModel> {
  MyBikesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FlatButton(
        padding: EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Text(
          "Tạo xe\nmới",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          textAlign: TextAlign.center,
        ),
        onPressed: () => Get.bottomSheet(AddBikeBottomSheet(), isScrollControlled: true),
        color: Colors.blueAccent,
      ),
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          "Danh sách xe",
          style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () => viewModel.loadVehicle(showLoading: false),
        child: Obx(
          () => EasyListView(
            placeholderWidget: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Bạn chưa có xe nào cả, hãy tạo xe và tham gia bảo dưỡng ngay!",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  FlatButton(
                    color: Colors.blueAccent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    onPressed: () => Get.bottomSheet(AddBikeBottomSheet(), isScrollControlled: true),
                    child: Text(
                      "Thêm xe mới",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            itemCount: viewModel.userVehicles?.length ?? 0,
            padding: EdgeInsets.all(16),
            itemBuilder: (ctx, index) => MyBikeItemView(viewModel.userVehicles[index]),
            dividerBuilder: (ctx, index) => SizedBox(height: 16),
          ),
        ),
      ),
    );
  }

  @override
  BaseViewState<MyBikesScreenModel> createState() => MyBikesScreenState();
}

class MyBikesScreenState extends BaseViewState<MyBikesScreenModel> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.build(context);
  }

  @override
  bool get wantKeepAlive => true;
}
