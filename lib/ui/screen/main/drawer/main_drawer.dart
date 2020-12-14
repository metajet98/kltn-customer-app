import 'package:customer_app/backend/auth_manager.dart';
import 'package:customer_app/locator.dart';
import 'package:customer_app/ui/base/base_view.dart';
import 'package:customer_app/ui/screen/main/drawer/main_drawer_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

class MainDrawer extends BaseView<MainDrawerModel> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      key: UniqueKey(),
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Row(
              children: [
                Container(
                  child: Icon(FontAwesome5.user),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(() => Text(viewModel.user?.fullName ?? "",
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),),
                    SizedBox(height: 4),
                    Obx(() => Text(viewModel.user?.phoneNumber ?? "", style: TextStyle(color: Colors.white30, fontSize: 14)),),
                  ],
                )
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
            ),
          ),
          ListTile(
            title: Text("Chính sách bảo mật"),
            leading: Icon(MaterialCommunityIcons.security),
            onTap: () {},
          ),
          ListTile(
            title: Text("Đổi mật khẩu"),
            leading: Icon(MaterialCommunityIcons.textbox_password),
            onTap: () {},
          ),
          ListTile(
            title: Text("Đăng xuất", style: TextStyle(color: Colors.redAccent),),
            leading: Icon(MaterialCommunityIcons.logout, color: Colors.redAccent,),
            onTap: () => locator<AuthManager>().logout(),
          ),
        ],
      ),
    );
  }

}