import 'package:customer_app/backend/services/auth_service.dart';
import 'package:customer_app/ui/base/base_view_model.dart';
import 'package:customer_app/ui/screen/login/login_screen.dart';
import 'package:customer_app/ui/screen/register/register_screen.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterScreenModel extends BaseViewModel<RegisterScreen> {

  final AuthService authService;

  RegisterScreenModel(this.authService);

  Future onRegister(String phoneNumber, String password) async {
    return call(() async {
      var result = await authService.login(phoneNumber: phoneNumber, password: password);
    }, background: false, toastOnError: true);
  }
}
