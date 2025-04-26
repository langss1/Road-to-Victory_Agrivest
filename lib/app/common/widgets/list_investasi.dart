import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListInvestasi extends StatelessWidget {
  final String heading;
  final String subheading;
  final int harga;
  final int slot;
  final String categoryTitle1;
  final String categoryIcon1;
  final String categoryData1;
  final Color categoryColor1;
  final String categoryTitle2;
  final String categoryIcon2;
  final String categoryData2;
  final Color categoryColor2;
  final String imgPath;

  const ListInvestasi(
      {super.key,
      required this.imgPath,
      required this.heading,
      required this.subheading,
      required this.harga,
      required this.slot,
      required this.categoryTitle1,
      required this.categoryIcon1,
      required this.categoryData1,
      required this.categoryTitle2,
      required this.categoryData2,
      required this.categoryColor1,
      required this.categoryColor2,
      required this.categoryIcon2});

  @override
  Widget build(BuildContext context) {
    final NumberFormat currencyFormatter =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);

    return Expanded(
        child: Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey)),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
                border: BorderDirectional(
                    bottom: BorderSide(width: 1, color: Colors.grey))),
            child: Row(
              children: [
                Expanded(
                    child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        imgPath,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      children: [Text(heading), Text(subheading)],
                    )
                  ],
                )),
                Expanded(
                    child: Column(
                  children: [
                    Text(currencyFormatter.format(harga)),
                    Text('Tersisa ${slot.toString()} slot')
                  ],
                ))
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
                            shape: BoxShape.circle, color: categoryColor1),
                        padding: EdgeInsets.all(4),
                        child: Image.asset(categoryIcon1),
                      ),
                      Column(
                        children: [Text(categoryTitle1), Text(categoryData1)],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: categoryColor1),
                        padding: EdgeInsets.all(4),
                        child: Image.asset(categoryIcon2),
                      ),
                      Column(
                        children: [Text(categoryTitle2), Text(categoryData2)],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
