import 'package:customer_app/backend/services/branch_service.dart';
import 'package:customer_app/models/branch/branch.dart';
import 'package:customer_app/ui/base/base_view_model.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class BranchMapScreenModel extends BaseViewModel {
  final _branches = RxList<Branch>();

  List<Branch> get branches => _branches.value;

  final BranchService branchService;

  BranchMapScreenModel(this.branchService);

  @override
  void onInit() {
    loadBranch();
    super.onInit();
  }

  void loadBranch() {
    call(() async {
      _branches.value = (await branchService.getAll()).data;
      print(branches.length);
    }, toastOnError: true);
  }
}