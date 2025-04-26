import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ListInvestasi extends StatelessWidget {
  final String heading;
  final String subheading;
  final int? harga;
  final int? slot;
  final String category;
  final String categoryData1;
  final String categoryData2;
  final String imgPath;
  final VoidCallback? onTap;

  const ListInvestasi(
      {super.key,
      required this.imgPath,
      required this.heading,
      required this.subheading,
      required this.harga,
      required this.slot,
      required this.category,
      required this.categoryData1,
      required this.categoryData2,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    final NumberFormat currencyFormatter =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);

    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: GestureDetector(
        onTap: onTap ?? () {},
        child: Row(
          children: [
            Expanded(
                child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Color(0xFFE9E9E9))),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                        border: BorderDirectional(
                            bottom: BorderSide(
                                width: 1, color: Color(0xFFE9E9E9)))),
                    child: Row(
                      children: [
                        Expanded(
                            child: Row(
                          children: [
                            Container(
                              width: 36,
                              padding: EdgeInsets.all(4),
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: Image.asset(
                                imgPath,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  heading,
                                  style: GoogleFonts.nunito(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF252525)),
                                ),
                                Text(
                                  subheading,
                                  style: GoogleFonts.nunito(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xFF6D6D6D)),
                                ),
                              ],
                            )
                          ],
                        )),
                        Expanded(
                            child: category == 'Hewan Ternak'
                                ? Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        currencyFormatter.format(harga),
                                        style: GoogleFonts.nunito(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF6D6D6D)),
                                      ),
                                      Text(
                                        'Tersisa ${slot.toString()} slot',
                                        style: GoogleFonts.nunito(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF90BA3E)),
                                      )
                                    ],
                                  )
                                : SizedBox())
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: category == 'Hewan Ternak'
                                        ? Color(0x33FF9500)
                                        : Color(0xFFEBEAE6)),
                                padding: EdgeInsets.all(4),
                                child: category == 'Hewan Ternak'
                                    ? Image.asset(
                                        'assets/images/icon_weight.png')
                                    : Image.asset('assets/images/icon_cow.png'),
                              ),
                              SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      category == 'Hewan Ternak'
                                          ? 'Est. Berat'
                                          : 'Total Ternak',
                                      style: GoogleFonts.nunito(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                          color: Color(0xFF6D6D6D))),
                                  Text(categoryData1,
                                      style: GoogleFonts.nunito(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF6D6D6D)))
                                ],
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: category == 'Hewan Ternak'
                                        ? Color(0xFFEAF7FF)
                                        : Color(0x3334C759)),
                                padding: EdgeInsets.all(4),
                                child: category == 'Hewan Ternak'
                                    ? Image.asset(
                                        'assets/images/icon_profit.png')
                                    : Image.asset(
                                        'assets/images/icon_check.png'),
                              ),
                              SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      category == 'Hewan Ternak'
                                          ? 'Est. Keuntungan'
                                          : 'Tersedia',
                                      style: GoogleFonts.nunito(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                          color: Color(0xFF6D6D6D))),
                                  Text(categoryData2,
                                      style: GoogleFonts.nunito(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                          color: Color(0xFF6D6D6D))),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
