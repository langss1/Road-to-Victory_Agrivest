import 'package:get/get.dart';

class PantauTernakController extends GetxController {
  var age = '2 Bulan'.obs;
  var farmName = 'Peternakan Sari Bumi'.obs;
  var currentWeight = 380.obs;
  var growthPercent = 12.obs;
  var currentAge = '8 Bulan'.obs;
  var initialPrice = 4000000.obs;

  var averageWeight = 373.obs;
  var cattleType = 'Limosin Jantan'.obs;
  var cattleAge = '1 Tahun'.obs;

  void sellLivestock() {
    Get.snackbar('Berhasil', 'Ternak berhasil dijual!');
    Get.toNamed('/home');
  }
}
