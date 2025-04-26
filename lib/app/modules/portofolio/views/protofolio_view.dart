import 'package:agrivest/app/common/customnavbar/custom_bottom_navbar.dart';
import 'package:agrivest/app/modules/portofolio/controllers/portofolio_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProtofolioView extends GetView<PortofolioController> {
  const ProtofolioView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Portofolio Saya',
          style: GoogleFonts.nunito(
              fontWeight: FontWeight.bold, color: Colors.black),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.green.shade50,
            padding: const EdgeInsets.all(24),
            child: Obx(
              () => Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nilai Portofolio',
                      style: GoogleFonts.nunito(color: Colors.grey),
                    ),
                    Row(
                      children: [
                        Text(
                          controller.isObscured.value ? 'Rp ****' : 'Rp 0',
                          style: GoogleFonts.nunito(
                            textStyle: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: controller.toggleObscure,
                          child: Icon(
                            controller.isObscured.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Keuntungan',
                                style: GoogleFonts.nunito(color: Colors.grey)),
                            const SizedBox(height: 4),
                            Text('Rp0',
                                style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('Persentase',
                                style: GoogleFonts.nunito(color: Colors.grey)),
                            const SizedBox(height: 4),
                            Text('0.00%',
                                style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Daftar Investasi',
                          style: GoogleFonts.nunito(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      const Icon(Icons.add, color: Colors.green),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Obx(
              () => ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: controller.investments.length,
                itemBuilder: (context, index) {
                  final item = controller.investments[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 24,
                              backgroundImage:
                                  AssetImage('assets/images/cow.png'),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(item.age,
                                      style: GoogleFonts.nunito(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                  const SizedBox(height: 4),
                                  Text(item.type,
                                      style: GoogleFonts.nunito(
                                          color: Colors.grey.shade600)),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Get.toNamed('/pantau');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green.shade300,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                elevation: 0,
                              ),
                              child: Text(
                                "Pantau Ternak",
                                style: GoogleFonts.nunito(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Divider(color: Colors.grey.shade300),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Nilai Portofolio',
                                    style: GoogleFonts.nunito(
                                        color: Colors.grey, fontSize: 12)),
                                const SizedBox(height: 4),
                                Text('Rp${item.value.toStringAsFixed(0)}',
                                    style: GoogleFonts.nunito(
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text('Keuntungan',
                                    style: GoogleFonts.nunito(
                                        color: Colors.grey, fontSize: 12)),
                                const SizedBox(height: 4),
                                Text('Rp${item.profit.toStringAsFixed(0)}',
                                    style: GoogleFonts.nunito(
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
