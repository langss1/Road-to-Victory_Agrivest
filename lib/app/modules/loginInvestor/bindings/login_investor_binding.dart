import 'package:agrivest/app/modules/loginInvestor/controllers/login_investor_controller.dart';

import 'package:get/get.dart';

class LoginInvestorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginInvestorController>(
      () => LoginInvestorController(),
    );
  }
}
