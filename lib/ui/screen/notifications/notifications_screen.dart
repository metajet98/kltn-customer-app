import 'package:customer_app/ui/base/base_view.dart';
import 'package:customer_app/ui/screen/notifications/notifications_screen_model.dart';
import 'package:customer_app/ui/screen/notifications/views/notification_item_view.dart';
import 'package:customer_app/ui/shared/list_view/easy_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class NotificationsScreen extends BaseView<NotificationsScreenModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          "Thông báo",
          style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: Obx(() => RefreshIndicator(
        onRefresh: () => viewModel.loadNotifications(showLoading: false),
        child: EasyListView(
          itemCount: viewModel.notifications?.length ?? 0,
          padding: EdgeInsets.all(16),
          itemBuilder: (ctx, index) => NotificationItemView(notification: viewModel.notifications[index]),
          dividerBuilder: (ctx, index) => SizedBox(height: 16),
        ),
      )),
    );
  }

  @override
  BaseViewState<NotificationsScreenModel> createState() => NotificationsScreenState();
}

class NotificationsScreenState extends BaseViewState<NotificationsScreenModel> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.build(context);
  }

  @override
  bool get wantKeepAlive => true;
}
