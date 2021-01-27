import 'package:customer_app/backend/services/user_service.dart';
import 'package:customer_app/ui/base/base_view_model.dart';
import 'package:customer_app/ui/screen/register/register_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterScreenModel extends BaseViewModel<RegisterScreen> {
  final UserService userService;

  RegisterScreenModel(this.userService);

  Future onRegister(String fullName, String phoneNumber, String password) async {
    return call(() async {
      if (!validate(fullName, phoneNumber, password)) return;
      var result = await userService.createAccount(phoneNumber: phoneNumber, password: password, fullName: fullName);
      Fluttertoast.showToast(msg: "Đăng kí tài khoản thành công!");
      Get.back();
    }, background: false, toastOnError: true);
  }

  bool validate(String fullName, String phoneNumber, String password) {
    if (GetUtils.isNullOrBlank(fullName)) {
      Fluttertoast.showToast(msg: "Vui lòng nhập họ và tên hợp lệ!");
      return false;
    }

    if (GetUtils.isNullOrBlank(phoneNumber) || phoneNumber.length != 10) {
      Fluttertoast.showToast(msg: "Vui lòng nhập số điện thoại hợp lệ! Số điện thoại hợp lệ bao gồm 10 chữ số");
      return false;
    }

    if (GetUtils.isNullOrBlank(password) || phoneNumber.length < 6) {
      Fluttertoast.showToast(msg: "Vui lòng nhập mật khẩu hợp lệ! Mật khẩu hợp lệ bao gồm 6 kí tự trở lên");
      return false;
    }

    return true;
  }
}
