import 'package:agrivest/app/modules/RegisterInvestor/controllers/register_investor_controller.dart';

import 'package:get/get.dart';

class RegisterInvestorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterInvestorController>(
      () => RegisterInvestorController(),
    );
  }
}
