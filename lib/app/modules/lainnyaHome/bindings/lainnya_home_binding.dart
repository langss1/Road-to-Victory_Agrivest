import 'package:get/get.dart';

import '../controllers/lainnya_home_controller.dart';

class LainnyaHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LainnyaHomeController>(
      () => LainnyaHomeController(),
    );
  }
}
