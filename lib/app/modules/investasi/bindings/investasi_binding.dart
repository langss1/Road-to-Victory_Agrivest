import 'package:agrivest/app/modules/investasi/controllers/investasi_controller.dart';
import 'package:get/get.dart';

class InvestasiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InvestasiController>(
      () => InvestasiController(),
    );
  }
}
