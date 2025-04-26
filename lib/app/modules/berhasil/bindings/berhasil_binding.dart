import 'package:agrivest/app/modules/berhasil/controllers/berhasil_controllers.dart';

import 'package:get/get.dart';

class BerhasilBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PembayaranBerhasilController>(
      () => PembayaranBerhasilController(),
    );
  }
}
