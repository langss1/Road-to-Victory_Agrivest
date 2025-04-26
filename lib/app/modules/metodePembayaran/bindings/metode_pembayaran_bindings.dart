import 'package:agrivest/app/modules/metodePembayaran/controllers/metode_pembayaran_controllers.dart';
import 'package:get/get.dart';

class MetodePembayaranBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MetodePembayaranController>(
      () => MetodePembayaranController(),
    );
  }
}
