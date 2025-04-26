import 'package:agrivest/app/modules/pilihAkun/controllers/pilih_akun_controller.dart';
import 'package:get/get.dart';

class PilihAkunBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PilihAkunController>(
      () => PilihAkunController(),
    );
  }
}
