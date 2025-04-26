import 'package:agrivest/app/modules/konfirmasiPembayaran/controllers/konfirmasi_pembayaran__controllers.dart';

import 'package:get/get.dart';

class KonfirmasiPembayaranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KonfirmasiPembayaranController>(
        () => KonfirmasiPembayaranController());
  }
}
