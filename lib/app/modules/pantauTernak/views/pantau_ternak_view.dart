import 'package:agrivest/app/modules/pantauTernak/controllers/pantau_ternak_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PantauTernakView extends GetView<PantauTernakController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Image.asset(
                      'assets/images/icon_back.png',
                      width: 24,
                    ),
                  ),
                  Center(
                    child: Text(
                      'Ternak Saya',
                      style: GoogleFonts.nunitoSans(
                        textStyle: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/images/image_peternakan.png',
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(() => Text(
                                  'Umur ${controller.age.value}',
                                  style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                )),
                            SizedBox(height: 4),
                            Obx(() => Text(
                                  controller.farmName.value,
                                  style: GoogleFonts.nunito(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                )),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Divider(color: Colors.grey.shade300),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.orange.shade50,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(Icons.monitor_weight,
                                  color: Colors.orange),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Berat Saat Ini',
                              style: GoogleFonts.nunito(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: 4),
                            Obx(() => Text(
                                  '${controller.currentWeight.value}kg',
                                  style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.green,
                                  ),
                                )),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.green.shade50,
                                shape: BoxShape.circle,
                              ),
                              child:
                                  Icon(Icons.show_chart, color: Colors.green),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Kenaikan',
                              style: GoogleFonts.nunito(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: 4),
                            Obx(() => Text(
                                  '${controller.growthPercent.value}%',
                                  style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.green,
                                  ),
                                )),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Divider(color: Colors.grey.shade300),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Umur Saat Ini',
                            style: GoogleFonts.nunito(color: Colors.grey)),
                        Obx(() => Text(controller.currentAge.value,
                            style: GoogleFonts.nunito())),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Harga Awal',
                            style: GoogleFonts.nunito(color: Colors.grey)),
                        Obx(() => Text(
                              'Rp${controller.initialPrice.value.toStringAsFixed(0)}',
                              style: GoogleFonts.nunito(),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Statistik',
                        style: GoogleFonts.nunito(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Berat Rata - Rata',
                                style: GoogleFonts.nunito(
                                    color: Colors.grey, fontSize: 12)),
                            SizedBox(height: 4),
                            Obx(() => Text(
                                  '${controller.averageWeight.value}kg',
                                  style: GoogleFonts.nunito(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                )),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('Sekarang',
                                style: GoogleFonts.nunito(
                                    color: Colors.grey, fontSize: 12)),
                            SizedBox(height: 4),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.trending_up,
                                    color: Colors.lightGreen, size: 18),
                                SizedBox(width: 4),
                                Obx(() => Text(
                                      '${controller.currentWeight.value}kg',
                                      style: GoogleFonts.nunito(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.lightGreen),
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Divider(color: Colors.grey.shade300),
                    SizedBox(height: 16),
                    Text('Informasi Ternak',
                        style: GoogleFonts.nunito(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Jenis Sapi',
                            style: GoogleFonts.nunito(color: Colors.grey)),
                        Obx(() => Text(controller.cattleType.value,
                            style: GoogleFonts.nunito())),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Usia',
                            style: GoogleFonts.nunito(color: Colors.grey)),
                        Obx(() => Text(controller.cattleAge.value,
                            style: GoogleFonts.nunito())),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              controller.sellLivestock();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightGreen,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
            ),
            child: Text(
              'Jual',
              style: GoogleFonts.nunito(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
