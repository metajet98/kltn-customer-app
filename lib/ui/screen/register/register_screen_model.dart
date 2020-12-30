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
      var result = await userService.createAccount(phoneNumber: phoneNumber, password: password, fullName: fullName);
      Fluttertoast.showToast(msg: "Đăng kí tài khoản thành công!");
      Get.back();
    }, background: false, toastOnError: true);
  }
}
