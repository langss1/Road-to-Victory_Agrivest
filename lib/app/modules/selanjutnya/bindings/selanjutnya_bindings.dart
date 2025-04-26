import 'package:agrivest/app/modules/selanjutnya/controllers/selanjutnya_controllers.dart';
import 'package:agrivest/app/modules/pilihAkun/controllers/pilih_akun_controller.dart';
import 'package:get/get.dart';

class DetailPembayaranBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailPembayaranController>(
      () => DetailPembayaranController(),
    );
  }
}
