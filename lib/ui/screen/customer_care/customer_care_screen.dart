import 'package:customer_app/ui/base/base_view.dart';
import 'package:customer_app/ui/screen/customer_care/bottom_sheet/create_topic/create_topic_bottom_sheet.dart';
import 'package:customer_app/ui/screen/customer_care/customer_care_screen_model.dart';
import 'package:customer_app/ui/screen/customer_care/views/topic_item_view.dart';
import 'package:customer_app/ui/shared/list_view/easy_listview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerCareScreen extends BaseView<CustomerCareScreenModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FlatButton(
        padding: EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Text(
          "Đặt câu hỏi\nngay",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          textAlign: TextAlign.center,
        ),
        onPressed: () => viewModel.openCreateTopic(),
        color: Colors.blueAccent,
      ),
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          "Hỗ trợ khách hàng",
          style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: Obx(() => RefreshIndicator(
            onRefresh: () => viewModel.loadTopic(showLoading: false),
            child: EasyListView(
              itemCount: viewModel.topics?.length ?? 0,
              padding: EdgeInsets.all(16),
              itemBuilder: (ctx, index) => TopicItemView(topic: viewModel.topics[index]),
              dividerBuilder: (ctx, index) => SizedBox(height: 16),
            ),
          )),
    );
  }

  @override
  BaseViewState<CustomerCareScreenModel> createState() => CustomerCareScreenState();
}

class CustomerCareScreenState extends BaseViewState<CustomerCareScreenModel> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.build(context);
  }

  @override
  bool get wantKeepAlive => true;
}
