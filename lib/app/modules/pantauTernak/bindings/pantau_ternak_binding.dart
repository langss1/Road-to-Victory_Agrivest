import 'package:agrivest/app/modules/pantauTernak/controllers/pantau_ternak_controller.dart';
import 'package:get/get.dart';

class PantauTernakBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PantauTernakController>(
      () => PantauTernakController(),
    );
  }
}
