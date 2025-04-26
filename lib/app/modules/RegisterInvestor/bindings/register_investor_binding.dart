import 'package:agrivest/app/modules/RegisterInvestor/controllers/register_investor_controller.dart';
import 'package:agrivest/app/modules/loginInvestor/controllers/login_investor_controller.dart';
import 'package:agrivest/app/modules/pilihAkun/controllers/pilih_akun_controller.dart';
import 'package:get/get.dart';

class RegisterInvestorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterInvestorController>(
      () => RegisterInvestorController(),
    );
  }
}
