import 'package:customer_app/backend/services/user_service.dart';
import 'package:customer_app/models/user/user.dart';
import 'package:customer_app/ui/base/base_view_model.dart';
import 'package:customer_app/ui/screen/main/drawer/main_drawer.dart';
import 'package:injectable/injectable.dart';
import 'package:get/get.dart';

@injectable
class MainDrawerModel extends BaseViewModel<MainDrawer> {
  final _user = User().obs;

  MainDrawerModel(this.userService);

  User get user => _user.value;

  final UserService userService;

  @override
  void onInit() {
    _loadData();
    super.onInit();
  }

  void _loadData() {
    call(() async {
      _user.value = (await userService.self()).data;
    }, background: false, toastOnError: true);
  }
}