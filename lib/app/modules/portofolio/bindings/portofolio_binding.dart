import 'package:agrivest/app/modules/portofolio/controllers/portofolio_controller.dart';
import 'package:get/get.dart';

class PortofolioBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PortofolioController>(
      () => PortofolioController(),
    );
  }
}
