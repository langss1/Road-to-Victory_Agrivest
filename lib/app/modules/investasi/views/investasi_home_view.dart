import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class InvestasiHomeView extends StatelessWidget {
  const InvestasiHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                      textStyle:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFF6D6D6D)),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
