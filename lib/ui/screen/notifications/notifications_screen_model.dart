import 'package:customer_app/backend/services/notification_service.dart';
import 'package:customer_app/models/notification/notification.dart';
import 'package:customer_app/ui/base/base_view_model.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@injectable
class NotificationsScreenModel extends BaseViewModel {
  final _notifications = RxList<Notification>();

  NotificationsScreenModel(this.notificationService);

  List<Notification> get notifications => _notifications.value;

  final NotificationService notificationService;

  @override
  void onInit() {
    loadNotifications();
    super.onInit();
  }

  Future loadNotifications({bool showLoading = true}) {
    return call(() async {
      _notifications.value = (await notificationService.getNotifications()).data;
    }, background: !showLoading, toastOnError: true);
  }
}