import 'package:get/get.dart';

class KonfirmasiPembayaranController extends GetxController {
  var statusPembayaran = 'Menunggu Pembayaran'.obs;
  var batasWaktuBayar = '2 April 2025, 10:30 WIB'.obs;

  var namaTernak = 'Sapi Limosin';
  var peternakan = 'Peternakan Sari Bumi';

  var namaBank = 'Bank Mandiri';
  var logoBank = 'assets/images/mandiri.png';

  var virtualAccount = '12348393933884';

  var totalPesanan = 3300000;
  var biayaAdmin = 3000;

  int get totalPembayaran => totalPesanan + biayaAdmin;

  void salinVA() {
    Get.snackbar('Disalin', 'Nomor virtual account disalin!');
  }
}
