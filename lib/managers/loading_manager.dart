import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoadingManager {
  int _loadingCount = 0;

  void showLoading({String status}) {
    if(_loadingCount == 0) {
      EasyLoading.show(status: status ?? "Vui lòng đợi...");
    }
    _loadingCount++;
  }

  void hideLoading() {
    if(_loadingCount == 1) {
      EasyLoading.dismiss();
    }
    _loadingCount--;
  }
}