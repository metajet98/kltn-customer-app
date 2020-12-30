import 'package:customer_app/backend/auth_manager.dart';
import 'package:customer_app/locator.dart';
import 'package:customer_app/ui/base/base_view.dart';
import 'package:customer_app/ui/screen/branch_map/branch_map_screen.dart';
import 'package:customer_app/ui/screen/customer_care/customer_care_screen.dart';
import 'package:customer_app/ui/screen/home/home_screen.dart';
import 'package:customer_app/ui/screen/main/drawer/main_drawer.dart';
import 'package:customer_app/ui/screen/main/main_screen_model.dart';
import 'package:customer_app/ui/screen/my_bikes/my_bikes_screen.dart';
import 'package:customer_app/ui/screen/notifications/notifications_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:flutter_icons/flutter_icons.dart';

class MainScreen extends BaseView<MainScreenModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: viewModel.onPageViewSnap,
        physics: NeverScrollableScrollPhysics(),
        controller: viewModel.pageController,
        children: [
          NotificationsScreen(),
          MyBikesScreen(),
          HomeScreen(),
          CustomerCareScreen(),
          BranchMapScreen(),
        ],
      ),
      drawer: MainDrawer(),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: viewModel.selectedIndex,
            showUnselectedLabels: true,
            backgroundColor: Colors.white,
            selectedLabelStyle: TextStyle(fontSize: 12, color: Colors.blueAccent),
            unselectedLabelStyle: TextStyle(fontSize: 12, color: Colors.grey),
            type: BottomNavigationBarType.fixed,
            elevation: 5,
            onTap: viewModel.onBottomNavSelect,
            items: [
              BottomNavigationBarItem(
                label: "Thông báo",
                icon: Icon(Icons.add_alert),
              ),
              BottomNavigationBarItem(
                label: "Xe",
                icon: Icon(FontAwesome.motorcycle),
              ),
              BottomNavigationBarItem(
                label: "Trang chủ",
                icon: Icon(FontAwesome.home),
              ),
              BottomNavigationBarItem(
                label: "Hỗ trợ",
                icon: Icon(Ionicons.md_chatboxes),
              ),
              BottomNavigationBarItem(
                label: "Chi nhánh",
                icon: Icon(MaterialIcons.map),
              ),
            ],
          )),
    );
  }
}
