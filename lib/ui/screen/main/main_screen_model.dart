import 'package:customer_app/backend/services/user_service.dart';
import 'package:customer_app/locator.dart';
import 'package:customer_app/storage/user_storage.dart';
import 'package:customer_app/ui/base/base_view_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class MainScreenModel extends BaseViewModel {
  final _selectedIndex = RxInt(2);
  final pageController = PageController(initialPage: 2, keepPage: true);

  final UserService userService;

  MainScreenModel(this.userService);

  int get selectedIndex => _selectedIndex.value;

  @override
  void onInit() {
    loadUser();
    super.onInit();
  }

  Future loadUser() async {
    return call(() async {
      var user = (await userService.self()).data;
      locator<UserStorage>().set(user.id);
    }, background: false, toastOnError: true);
  }

  void onBottomNavSelect(int index) {
    _selectedIndex.value = index;
    pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void onPageViewSnap(int index) {
    _selectedIndex.value = index;
  }
}
