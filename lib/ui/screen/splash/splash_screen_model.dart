import 'package:customer_app/backend/auth_manager.dart';
import 'package:customer_app/fcm/fcm_manager.dart';
import 'package:customer_app/ui/base/base_view_model.dart';
import 'package:customer_app/ui/screen/login/login_screen.dart';
import 'package:customer_app/ui/screen/main/main_screen.dart';
import 'package:customer_app/ui/screen/splash/splash_screen.dart';
import 'package:get/route_manager.dart';
import 'package:injectable/injectable.dart';

@injectable
class SplashScreenModel extends BaseViewModel<SplashScreen> {

  final FcmManager fcmManager;
  final AuthManager authManager;

  SplashScreenModel(this.fcmManager, this.authManager);

  @override
  Future<void> onInit() async {
    super.onInit();
    fcmManager.init();
    await Future.delayed(const Duration(seconds: 2), () {
      Get.offAll(authManager.isLoggedIn() ? MainScreen() : LoginScreen());
    });
  }
}
