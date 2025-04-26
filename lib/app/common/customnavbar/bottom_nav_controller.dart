import 'package:get/get.dart';

class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;

  void changeTabIndex(int index) {
    selectedIndex.value = index;

    switch (index) {
      case 0:
        Get.toNamed('/home');
        break;
      case 1:
        Get.toNamed('/portofolio');
        break;
      case 2:
        Get.toNamed('/riwayat');
        break;
      case 3:
        Get.toNamed('/profil');
        break;
      default:
        Get.toNamed('/home');
    }
  }
}
