import 'package:agrivest/app/modules/pilihAkun/controllers/pilih_akun_controller.dart';
import 'package:agrivest/app/modules/riwayat/controllers/riwayat_controller.dart';
import 'package:get/get.dart';

class RiwayatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RiwayatController>(
      () => RiwayatController(),
    );
  }
}
