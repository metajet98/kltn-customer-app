import 'package:customer_app/ui/base/base_view.dart';
import 'package:customer_app/ui/screen/customer_care/customer_care_screen_model.dart';
import 'package:customer_app/ui/screen/customer_care/views/topic_item_view.dart';
import 'package:customer_app/ui/shared/list_view/easy_listview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomerCareScreen extends BaseView<CustomerCareScreenModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          "Hỗ trợ khách hàng",
          style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.blueAccent,
            ),
            onPressed: () {}),
        ],
      ),
      body: EasyListView(
        itemCount: 10,
        padding: EdgeInsets.all(16),
        itemBuilder: (ctx, index) => TopicItemView(),
        dividerBuilder: (ctx, index) => SizedBox(height: 16),
      ),
    );
  }

}