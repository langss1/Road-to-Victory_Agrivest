import 'package:agrivest/app/modules/metodePembayaran/controllers/metode_pembayaran_controllers.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MetodePembayaranView extends StatelessWidget {
  final MetodePembayaranController controller =
      Get.put(MetodePembayaranController());

  final List<Map<String, String>> eWallets = [
    {'name': 'OVO', 'asset': 'assets/images/ovo.png'},
    {'name': 'GoPay', 'asset': 'assets/images/gopay.png'},
    {'name': 'DANA', 'asset': 'assets/images/dana.png'},
    {'name': 'ShopeePay', 'asset': 'assets/images/shopeepay.png'},
  ];

  final List<Map<String, String>> banks = [
    {'name': 'Bank Mandiri', 'asset': 'assets/images/mandiri.png'},
    {'name': 'Bank BCA', 'asset': 'assets/images/bca.png'},
    {'name': 'Bank BNI', 'asset': 'assets/images/bni.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        flexibleSpace: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                left: 0,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.black,
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
              Center(
                child: Text(
                  'Metode Pembayaran',
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          _buildSectionTitle('e-Wallet'),
          const SizedBox(height: 10),
          ...eWallets
              .map((item) => _buildPaymentOption(item['name']!, item['asset']!))
              .toList(),
          const SizedBox(height: 24),
          _buildSectionTitle('Bank'),
          const SizedBox(height: 10),
          ...banks
              .map((item) => _buildPaymentOption(item['name']!, item['asset']!))
              .toList(),
          const Spacer(),
          Obx(() => Padding(
                padding: const EdgeInsets.all(16),
                child: ElevatedButton(
                  onPressed: controller.isButtonEnabled ? () {} : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: controller.isButtonEnabled
                        ? const Color(0xFF8BC34A)
                        : Colors.grey,
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed('/selanjutnya');
                    },
                    child: Text(
                      'Konfirmasi',
                      style: GoogleFonts.nunito(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        title,
        style: GoogleFonts.nunito(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildPaymentOption(String title, String assetPath) {
    return Obx(() => Column(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              leading: Image.asset(
                assetPath,
                width: 30,
                height: 30,
              ),
              title: Text(
                title,
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              trailing: GestureDetector(
                onTap: () {
                  controller.selectMethod(title);
                },
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: controller.selectedMethod.value == title
                          ? const Color(0xFF8BC34A)
                          : Colors.grey,
                      width: 2.5,
                    ),
                  ),
                  child: controller.selectedMethod.value == title
                      ? Center(
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF8BC34A),
                            ),
                          ),
                        )
                      : null,
                ),
              ),
            ),
            const Divider(
              height: 1,
              thickness: 0.5,
              indent: 16,
              endIndent: 16,
              color: Colors.grey,
            ),
          ],
        ));
  }
}
