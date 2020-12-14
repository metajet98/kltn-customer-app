import 'package:customer_app/ui/base/base_view_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class MainScreenModel extends BaseViewModel {
  final _selectedIndex = RxInt(2);
  final pageController = PageController(initialPage: 2, keepPage: true);

  int get selectedIndex => _selectedIndex.value;

  void onBottomNavSelect(int index) {
    _selectedIndex.value = index;
    pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void onPageViewSnap(int index) {
    _selectedIndex.value = index;
  }
}
