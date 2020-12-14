import 'package:customer_app/ui/base/base_view_model.dart';
import 'package:customer_app/ui/screen/home/home_screen.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeScreenModel extends BaseViewModel<HomeScreen> {
  final _bannerIndex = RxInt(0);

  int get bannerIndex => _bannerIndex.value;

  void setBannerIndex(int index) {
    _bannerIndex.value = index;
  }
}