import 'package:agrivest/app/modules/berhasil/controllers/berhasil_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PembayaranBerhasilView extends StatelessWidget {
  final PembayaranBerhasilController controller =
      Get.put(PembayaranBerhasilController());

  PembayaranBerhasilView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 48),
              // Icon centang
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green.withOpacity(0.1),
                ),
                padding: const EdgeInsets.all(24),
                child: const Icon(
                  Icons.check_circle,
                  size: 80,
                  color: Color(0xFF8BC34A),
                ),
              ),
              const SizedBox(height: 32),

              Text(
                'Berhasil',
                style: GoogleFonts.nunito(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 12),

              Obx(() => Text(
                    'Anda telah berhasil melakukan pembayaran untuk\ninvestasi ternak Anda sebesar Rp.${controller.nominalPembayaran.value.toStringAsFixed(4)}',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  )),
              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Get.offAllNamed('/home');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8BC34A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Ke Halaman Utama',
                    style: GoogleFonts.nunito(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              GestureDetector(
                onTap: () {
                  Get.toNamed('/riwayat');
                },
                child: Text(
                  'Lihat Riwayat Transaksi',
                  style: GoogleFonts.nunito(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF8BC34A),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
