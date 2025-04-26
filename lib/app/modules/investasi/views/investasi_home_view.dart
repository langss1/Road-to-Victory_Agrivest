import 'package:agrivest/app/common/widgets/button.dart';
import 'package:agrivest/app/common/widgets/list_investasi.dart';
import 'package:agrivest/app/modules/investasi/controllers/investasi_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class InvestasiHomeView extends GetView<InvestasiController> {
  final InvestasiController controller = Get.put(InvestasiController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
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
                      'Investasi',
                      style: GoogleFonts.nunitoSans(
                        textStyle: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ))
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                color: Color(0xFFF4F8EC),
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xFFEBEAE6)),
                        child: Image.asset(
                          'assets/images/icon_farm.png',
                          fit: BoxFit.contain,
                          height: 24,
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Investasi Ternak',
                              textAlign: TextAlign.start,
                              style: GoogleFonts.nunitoSans(
                                textStyle: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF252525)),
                              ),
                            ),
                            Text(
                              'Investasi Ternak memiliki berbagai pilihan jenis hewan ternak dengan pilihan return yang lebih tinggi dibanding investasi biasa',
                              maxLines: 3,
                              overflow: TextOverflow.fade,
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.nunitoSans(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Color(0xFF6D6D6D),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pilih Berdasarkan',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.nunitoSans(
                          textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF252525)),
                        ),
                      ),
                      SizedBox(height: 16),
                      Obx(() => Row(
                            children: [
                              Button(
                                text: 'Peternakan',
                                sizeCategory: 'Small',
                                isActive: true,
                                isFilled:
                                    controller.category.value == 'Peternakan',
                                onTap: () {
                                  controller.changeCategory('Peternakan');
                                },
                              ),
                              SizedBox(width: 16),
                              Button(
                                text: 'Hewan Ternak',
                                sizeCategory: 'Small',
                                isActive: true,
                                isFilled:
                                    controller.category.value == 'Hewan Ternak',
                                onTap: () {
                                  controller.changeCategory('Hewan Ternak');
                                },
                              ),
                            ],
                          )),
                      SizedBox(height: 16),
                      Obx(() => controller.selectedList.isEmpty
                          ? Center(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  'Tidak ada investasi yang tersedia',
                                  style: GoogleFonts.nunitoSans(
                                    textStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xFF252525)),
                                  ),
                                ),
                              ),
                            )
                          : Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: controller.selectedList
                                      .map((item) => ListInvestasi(
                                            imgPath: item.imgPath,
                                            heading: item.name,
                                            subheading: item.subheading,
                                            harga: item.harga,
                                            slot: item.slot,
                                            categoryData1: item.categoryData1,
                                            categoryData2: item.categoryData2,
                                            category: item.category,
                                            onTap: () => Get.toNamed(
                                                '/investasi-detail',
                                                arguments: item),
                                          ))
                                      .toList(),
                                ),
                              ),
                            )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
