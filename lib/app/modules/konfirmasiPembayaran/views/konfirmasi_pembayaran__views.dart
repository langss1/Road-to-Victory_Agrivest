import 'package:agrivest/app/modules/konfirmasiPembayaran/controllers/konfirmasi_pembayaran__controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class KonfirmasiPembayaranView extends StatelessWidget {
  final KonfirmasiPembayaranController controller =
      Get.put(KonfirmasiPembayaranController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:
            Text('Pembayaran', style: GoogleFonts.nunito(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24), // <<< INI 24PX!
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),

            // Box Status
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF7E5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.access_time,
                          size: 20, color: Colors.orange),
                      const SizedBox(width: 8),
                      Obx(() => Text(
                            controller.statusPembayaran.value,
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          )),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Obx(() => Text(
                        'Bayar sebelum ${controller.batasWaktuBayar.value}',
                        style: GoogleFonts.nunito(
                            fontSize: 12, color: Colors.black54),
                      )),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Investasi Ternak
            _sectionTitle('Investasi Ternak'),
            const SizedBox(height: 12),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/cow.png',
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(controller.namaTernak,
                        style: GoogleFonts.nunito(fontWeight: FontWeight.bold)),
                    Text(controller.peternakan,
                        style: GoogleFonts.nunito(
                            fontSize: 12, color: Colors.grey)),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Metode Pembayaran
            _sectionTitle('Metode Pembayaran'),
            const SizedBox(height: 12),
            Row(
              children: [
                Image.asset(controller.logoBank, width: 60),
                const SizedBox(width: 12),
                Text(controller.namaBank,
                    style: GoogleFonts.nunito(fontSize: 14)),
              ],
            ),

            const SizedBox(height: 32),

            // Virtual Account
            _sectionTitle('Nomor Virtual Account'),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      controller.virtualAccount,
                      style: GoogleFonts.nunito(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => controller.salinVA(),
                    child:
                        const Icon(Icons.copy, size: 20, color: Colors.orange),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Detail Pembayaran
            _sectionTitle('Detail Pembayaran'),
            const SizedBox(height: 12),
            _buildDetailRow('Total Pesanan', controller.totalPesanan),
            const SizedBox(height: 8),
            _buildDetailRow('Biaya Admin', controller.biayaAdmin),
            const Divider(height: 32),
            _buildDetailRow('Total Pembayaran', controller.totalPembayaran,
                isHighlight: true),

            const Spacer(),

            // Tombol Lihat Cara Pembayaran
            SizedBox(
              width: double.infinity,
              height: 48,
              child: OutlinedButton(
                onPressed: () {
                  // Aksi lihat cara pembayaran
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFF8BC34A)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Lihat Cara Pembayaran',
                  style: GoogleFonts.nunito(
                    color: const Color(0xFF8BC34A),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.nunito(
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );
  }

  Widget _buildDetailRow(String label, int value, {bool isHighlight = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: GoogleFonts.nunito(fontSize: 13)),
        Text(
          'Rp${_formatRupiah(value)}',
          style: GoogleFonts.nunito(
            fontSize: 13,
            fontWeight: isHighlight ? FontWeight.bold : FontWeight.normal,
            color: isHighlight ? const Color(0xFF8BC34A) : Colors.black,
          ),
        ),
      ],
    );
  }

  String _formatRupiah(int amount) {
    return amount.toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.');
  }
}
