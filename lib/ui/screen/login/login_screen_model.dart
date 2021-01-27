import 'package:customer_app/backend/auth_manager.dart';
import 'package:customer_app/locator.dart';
import 'package:customer_app/ui/base/base_view_model.dart';
import 'package:customer_app/ui/screen/login/login_screen.dart';
import 'package:customer_app/ui/screen/main/main_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:customer_app/extensions/context_ext.dart';

@injectable
class LoginScreenModel extends BaseViewModel<LoginScreen> {
  Future onLogin(String phoneNumber, String password) async {
    if(!validate(phoneNumber, password)) return;
    Get.context.hideKeyboard();
    return call(() async {
      await locator<AuthManager>().login(phoneNumber, password);
      Get.offAll(MainScreen());
    }, background: false, toastOnError: true);
  }

  bool validate(String phoneNumber, String password) {
    if(GetUtils.isNullOrBlank(phoneNumber) || phoneNumber.length != 10) {
      Fluttertoast.showToast(msg: "Vui lòng nhập số điện thoại hợp lệ! Số điện thoại phải bao gồm 10 chữ số");
      return false;
    }
    if(GetUtils.isNullOrBlank(password)) {
      Fluttertoast.showToast(msg: "Vui lòng nhập số mật khẩu hợp lệ!");
      return false;
    }
    return true;
  }
}
