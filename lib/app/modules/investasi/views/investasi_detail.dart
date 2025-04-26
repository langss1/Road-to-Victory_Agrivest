import 'dart:math';

import 'package:agrivest/app/common/widgets/button.dart';
import 'package:agrivest/app/common/widgets/list_ternak.dart';
import 'package:agrivest/app/common/widgets/tab_element.dart';
import 'package:agrivest/app/modules/investasi/controllers/investasi_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class InvestasiDetailView extends GetView<InvestasiController> {
  final InvestasiController controller = Get.put(InvestasiController());
  final Product produk = Get.arguments;
  final NumberFormat currencyFormatter =
      NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(children: [
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
                      'Detail',
                      style: GoogleFonts.nunitoSans(
                        textStyle: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ))
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                        color: Color(0xFFF4F8EC),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Container(
                                        padding: EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Colors.white),
                                        child: Column(
                                          children: [
                                            Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 8),
                                              decoration: BoxDecoration(
                                                  border: BorderDirectional(
                                                      bottom: BorderSide(
                                                          width: 1,
                                                          color: Color(
                                                              0xFFE9E9E9)))),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                      child: Row(
                                                    children: [
                                                      Container(
                                                        width: 64,
                                                        padding:
                                                            EdgeInsets.all(4),
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle),
                                                        child: Image.asset(
                                                          produk.imgPath,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      SizedBox(width: 8),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            produk.name,
                                                            style: GoogleFonts.nunito(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Color(
                                                                    0xFF252525)),
                                                          ),
                                                          Text(
                                                            produk.subheading,
                                                            style: GoogleFonts.nunito(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                color: Color(
                                                                    0xFF6D6D6D)),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  )),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  border: BorderDirectional(
                                                      bottom: BorderSide(
                                                          width: 1,
                                                          color: Color(
                                                              0xFFE9E9E9)))),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 8),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          decoration: BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color: produk
                                                                          .category ==
                                                                      'Hewan Ternak'
                                                                  ? Color(
                                                                      0x33FF9500)
                                                                  : Color(
                                                                      0xFFEBEAE6)),
                                                          padding:
                                                              EdgeInsets.all(4),
                                                          child: produk
                                                                      .category ==
                                                                  'Hewan Ternak'
                                                              ? Image.asset(
                                                                  'assets/images/icon_weight.png')
                                                              : Image.asset(
                                                                  'assets/images/icon_cow.png'),
                                                        ),
                                                        SizedBox(width: 8),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                                produk.category ==
                                                                        'Hewan Ternak'
                                                                    ? 'Est. Berat'
                                                                    : 'Total Ternak',
                                                                style: GoogleFonts.nunito(
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    color: Color(
                                                                        0xFF6D6D6D))),
                                                            Text(
                                                                produk
                                                                    .categoryData1,
                                                                style: GoogleFonts.nunito(
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: Color(
                                                                        0xFF6D6D6D)))
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
                                                              shape: BoxShape
                                                                  .circle,
                                                              color: produk
                                                                          .category ==
                                                                      'Hewan Ternak'
                                                                  ? Color(
                                                                      0xFFEAF7FF)
                                                                  : Color(
                                                                      0x3334C759)),
                                                          padding:
                                                              EdgeInsets.all(4),
                                                          child: produk
                                                                      .category ==
                                                                  'Hewan Ternak'
                                                              ? Image.asset(
                                                                  'assets/images/icon_profit.png')
                                                              : Image.asset(
                                                                  'assets/images/icon_check.png'),
                                                        ),
                                                        SizedBox(width: 8),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                                produk.category ==
                                                                        'Hewan Ternak'
                                                                    ? 'Est. Keuntungan'
                                                                    : 'Tersedia',
                                                                style: GoogleFonts.nunito(
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    color: Color(
                                                                        0xFF6D6D6D))),
                                                            Text(
                                                                produk
                                                                    .categoryData2,
                                                                style: GoogleFonts.nunito(
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    color: Color(
                                                                        0xFF6D6D6D))),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(top: 8),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text('Estimasi Panen',
                                                          style: GoogleFonts.nunito(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              color: Color(
                                                                  0xFF666464))),
                                                      Expanded(
                                                        child: Text('1,5 Tahun',
                                                            textAlign:
                                                                TextAlign.end,
                                                            style: GoogleFonts.nunito(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                color: Color(
                                                                    0xFF666464))),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(height: 12),
                                                  Row(
                                                    children: [
                                                      Text('Dividen',
                                                          style: GoogleFonts.nunito(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              color: Color(
                                                                  0xFF666464))),
                                                      Expanded(
                                                        child: Text('xxxxxx',
                                                            textAlign:
                                                                TextAlign.end,
                                                            style: GoogleFonts.nunito(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                color: Color(
                                                                    0xFF666464))),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      )),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Informasi Ternak',
                                style: GoogleFonts.nunito(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF252525))),
                            SizedBox(height: 16),
                            Column(
                              children: [
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width - 32,
                                    padding: EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          width: 1, color: Color(0xFFE9E9E9)),
                                    ),
                                    child: Expanded(
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Harga Pasar',
                                                style: GoogleFonts.nunito(
                                                  color: Color(0xFF515151),
                                                  fontSize: 14,
                                                ),
                                              ),
                                              Text(
                                                '21 April 2025',
                                                textAlign: TextAlign.end,
                                                style: GoogleFonts.nunito(
                                                  color: Color(0xFF515151),
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 8),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                currencyFormatter
                                                    .format(produk.harga),
                                                style: GoogleFonts.nunito(
                                                  color: Color(0xFF252525),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                ' per ekor',
                                                style: GoogleFonts.nunito(
                                                  color: Color(0xFF252525),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 8),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'assets/images/icon_trend-up.png',
                                                width: 24,
                                              ),
                                              SizedBox(width: 8),
                                              Text(
                                                currencyFormatter
                                                    .format(produk.harga / 10),
                                                style: GoogleFonts.nunito(
                                                    color: Color(0xFF90BA3E),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                ' (+10%)',
                                                textAlign: TextAlign.start,
                                                style: GoogleFonts.nunito(
                                                    color: Color(0xFF90BA3E),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(width: 8),
                                              Text(
                                                ' 1 Bulan Terakhir',
                                                textAlign: TextAlign.end,
                                                style: GoogleFonts.nunito(
                                                    color: Color(0xFF515151),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                                SizedBox(height: 24),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width - 32,
                                  child: Image.asset(
                                    'assets/images/graph_placeholder.png',
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                SizedBox(height: 24),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width - 32,
                                  child: Obx(() => Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          TabElement(
                                              text: '1H',
                                              isSelected:
                                                  controller.time.value == '1H',
                                              onTap: () =>
                                                  controller.changeTime('1H')),
                                          TabElement(
                                              text: '1B',
                                              isSelected:
                                                  controller.time.value == '1B',
                                              onTap: () =>
                                                  controller.changeTime('1B')),
                                          TabElement(
                                              text: '3B',
                                              isSelected:
                                                  controller.time.value == '3B',
                                              onTap: () =>
                                                  controller.changeTime('3B')),
                                          TabElement(
                                              text: 'YTD',
                                              isSelected:
                                                  controller.time.value ==
                                                      'YTD',
                                              onTap: () =>
                                                  controller.changeTime('YTD')),
                                          TabElement(
                                              text: '1Y',
                                              isSelected:
                                                  controller.time.value == '1Y',
                                              onTap: () =>
                                                  controller.changeTime('1Y')),
                                          TabElement(
                                              text: 'All',
                                              isSelected:
                                                  controller.time.value ==
                                                      'All',
                                              onTap: () =>
                                                  controller.changeTime('All')),
                                        ],
                                      )),
                                ),
                              ],
                            ),
                            SizedBox(height: 24),
                            Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                  border: Border.all(color: Color(0xFFE9E9E9))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Statistik',
                                      style: GoogleFonts.nunito(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF252525))),
                                  SizedBox(height: 16),
                                  Container(
                                    padding: EdgeInsets.only(bottom: 8),
                                    decoration: BoxDecoration(
                                        border: BorderDirectional(
                                            bottom: BorderSide(
                                                width: 1,
                                                color: Color(0xFFE9E9E9)))),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text('Harga Terendah',
                                                      style: GoogleFonts.nunito(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: Color(
                                                              0xFF515151))),
                                                  Row(children: [
                                                    Image.asset(
                                                      'assets/images/icon_trend-down.png',
                                                      width: 24,
                                                    ),
                                                    SizedBox(width: 8),
                                                    Text(
                                                      currencyFormatter.format(
                                                          produk.harga * 0.9),
                                                      style: GoogleFonts.nunito(
                                                          color:
                                                              Color(0xFFE24414),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ])
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text('Harga Tertinggi',
                                                      style: GoogleFonts.nunito(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: Color(
                                                              0xFF515151))),
                                                  Row(children: [
                                                    Image.asset(
                                                      'assets/images/icon_trend-up.png',
                                                      width: 24,
                                                    ),
                                                    SizedBox(width: 8),
                                                    Text(
                                                      currencyFormatter.format(
                                                          produk.harga * 1.1),
                                                      style: GoogleFonts.nunito(
                                                          color:
                                                              Color(0xFF90BA3E),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ])
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 16),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text('Rata-rata Harga',
                                                      style: GoogleFonts.nunito(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: Color(
                                                              0xFF515151))),
                                                  SizedBox(width: 8),
                                                  Text(
                                                    currencyFormatter.format(
                                                        produk.harga * 0.9),
                                                    style: GoogleFonts.nunito(
                                                        color:
                                                            Color(0xFF252525),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 8),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text('Min. Pembelian',
                                                style: GoogleFonts.nunito(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Color(0xFF666464))),
                                            Expanded(
                                              child: Text(
                                                  currencyFormatter.format(
                                                      produk.harga / 100),
                                                  textAlign: TextAlign.end,
                                                  style: GoogleFonts.nunito(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color:
                                                          Color(0xFF666464))),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 12),
                                        Row(
                                          children: [
                                            Text('Persentase tiap lot',
                                                style: GoogleFonts.nunito(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Color(0xFF666464))),
                                            Expanded(
                                              child: Text('1%',
                                                  textAlign: TextAlign.end,
                                                  style: GoogleFonts.nunito(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color:
                                                          Color(0xFF666464))),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pilih Ternak',
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
                                      text: 'Tersedia',
                                      sizeCategory: 'Small',
                                      isActive: true,
                                      isFilled: controller.availability.value ==
                                          'Tersedia',
                                      onTap: () {
                                        controller
                                            .changeAvailability('Tersedia');
                                      },
                                    ),
                                    SizedBox(width: 16),
                                    Button(
                                      text: 'Segera',
                                      sizeCategory: 'Small',
                                      isActive: true,
                                      isFilled: controller.availability.value ==
                                          'Segera',
                                      onTap: () {
                                        controller.changeAvailability('Segera');
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
                                : Column(
                                    children: controller.selectedList
                                        .map((item) => Column(
                                              children: [
                                                ListTernak(
                                                  imgPath: item.imgPath,
                                                  namaTernak: item.name,
                                                  namaPeternakan:
                                                      item.subheading,
                                                  hargaTernak: item.harga,
                                                  satuan: '/ekor',
                                                  change: Random().nextDouble(),
                                                  isSelected: controller
                                                          .selectedTernak
                                                          .value ==
                                                      item,
                                                  onTap: () {
                                                    controller
                                                        .changeSelectedTernak(
                                                            item);
                                                  },
                                                ),
                                                SizedBox(height: 12),
                                              ],
                                            ))
                                        .toList(),
                                  )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
            bottomNavigationBar: Obx(
              () => Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                height: 104,
                child: Button(
                  text: 'Beli',
                  sizeCategory: 'Large',
                  isFilled: controller.selectedTernak.value != null,
                  isActive: true,
                  onTap: () => Get.toNamed('/metode-pembayaran',
                      arguments: controller.selectedTernak.value),
                ),
              ),
            )),
      ),
    );
  }
}
