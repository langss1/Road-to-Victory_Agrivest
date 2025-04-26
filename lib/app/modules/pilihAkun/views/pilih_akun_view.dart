import 'package:agrivest/app/common/widgets/button.dart';
import 'package:agrivest/app/modules/pilihAkun/controllers/pilih_akun_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PilihAkunView extends GetView<PilihAkunController> {
  final PilihAkunController controller = Get.put(PilihAkunController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 65),
            Text(
              'Pilih Akun',
              style: GoogleFonts.nunitoSans(
                textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
              ),
            ),
            Text(
              'Sebelum melanjutkan, Anda ingin bergabung sebagai:',
              style: GoogleFonts.nunitoSans(
                textStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF252525)),
              ),
            ),
            const SizedBox(height: 20),
            Obx(() => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _accountOption(
                      label: 'Investor',
                      imagePath: 'assets/images/investor.png',
                      selected: controller.selectedAccount.value ==
                          AccountType.investor,
                      onTap: () =>
                          controller.selectAccount(AccountType.investor),
                    ),
                    const SizedBox(height: 25),
                    _accountOption(
                      label: 'Mitra',
                      imagePath: 'assets/images/mitra.png',
                      selected:
                          controller.selectedAccount.value == AccountType.mitra,
                      onTap: () => controller.selectAccount(AccountType.mitra),
                    ),
                  ],
                )),
            const SizedBox(height: 40),
            Obx(
              () => ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 56),
                  backgroundColor: controller.selectedAccount.value == null
                      ? Colors.white
                      : Color(0xFF90BA3E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: controller.selectedAccount.value == null
                    ? null
                    : controller.continueToNext,
                child: Text(
                  'Selanjutnya',
                  style: GoogleFonts.nunitoSans(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Button(
                  text: 'Login',
                  sizeCategory: 'Large',
                  isActive: false,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _accountOption({
    required String label,
    required String imagePath,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        height: 96,
        decoration: BoxDecoration(
          border: Border.all(
            color: selected ? Colors.lightGreen : Colors.grey,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
          color: selected ? Colors.lightGreen.withOpacity(0.1) : Colors.white,
        ),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              height: 64,
              width: 64,
            ),
            const SizedBox(width: 10),
            Text(
              label,
              style: GoogleFonts.nunitoSans(
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: selected ? Colors.lightGreen : Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
