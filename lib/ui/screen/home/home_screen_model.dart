import 'package:customer_app/backend/services/notification_service.dart';
import 'package:customer_app/models/notification/banner.dart';
import 'package:customer_app/models/notification/news.dart';
import 'package:customer_app/ui/base/base_view_model.dart';
import 'package:customer_app/ui/screen/home/home_screen.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeScreenModel extends BaseViewModel<HomeScreen> {
  final _bannerIndex = RxInt(0);

  HomeScreenModel(this.notificationService);

  int get bannerIndex => _bannerIndex.value;

  void setBannerIndex(int index) {
    _bannerIndex.value = index;
  }

  final _banners = RxList<Banner>();
  final _news = RxList<News>();

  List<Banner> get banners => _banners.value;

  List<News> get news => _news.value;

  final NotificationService notificationService;

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  Future loadData({bool showLoading = true}) async {
    return call(() async {
      _banners.value = (await notificationService.getBanners()).data;
      _news.value = (await notificationService.getNews()).data;
    }, toastOnError: true, background: !showLoading);
  }
}
