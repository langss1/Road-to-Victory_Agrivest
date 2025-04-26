import 'package:get/get.dart';

class DetailPembayaranController extends GetxController {
  var hargaBeli = 3300000.obs;
  var persenInvestasi = 100.obs;
  var biayaAdmin = 3000.obs;

  String selectedPaymentMethod = 'Bank Mandiri';

  int get totalPesanan => (hargaBeli.value * persenInvestasi.value ~/ 100);
  int get totalPembayaran => totalPesanan + biayaAdmin.value;

  void selectPaymentMethod(String method) {
    selectedPaymentMethod = method;
    update();
  }

  void updateCalculation() {
    update();
  }
}
