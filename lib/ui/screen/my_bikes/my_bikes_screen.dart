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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          "Danh sách xe",
          style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.blueAccent,
              ),
              onPressed: () => Get.bottomSheet(AddBikeBottomSheet(), isScrollControlled: true)),
        ],
      ),
      body: EasyListView(
        itemCount: 10,
        padding: EdgeInsets.all(16),
        itemBuilder: (ctx, index) => MyBikeItemView(),
        dividerBuilder: (ctx, index) => SizedBox(height: 16),
      ),
    );
  }
}
