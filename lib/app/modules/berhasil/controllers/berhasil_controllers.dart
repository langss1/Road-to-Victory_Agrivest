import 'package:get/get.dart';

class PembayaranBerhasilController extends GetxController {
  var nominalPembayaran = 0.0.obs;

  void setNominal(double value) {
    nominalPembayaran.value = value;
  }
}
