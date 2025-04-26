import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ListTernak extends StatelessWidget {
  final String imgPath;
  final String namaTernak;
  final String namaPeternakan;
  final int hargaTernak;
  final String satuan;
  final double change;

  final bool isSelected;
  final VoidCallback? onTap;

  const ListTernak(
      {super.key,
      required this.imgPath,
      required this.namaTernak,
      required this.namaPeternakan,
      required this.hargaTernak,
      required this.satuan,
      required this.change,
      this.isSelected = false,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    final NumberFormat currencyFormatter =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);

    final NumberFormat percentageFormatter = NumberFormat.percentPattern()
      ..minimumFractionDigits = 2
      ..maximumFractionDigits = 2;

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          border: Border.all(
              color: isSelected ? Colors.green : Colors.grey,
              width: isSelected ? 2 : 1)),
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(imgPath, fit: BoxFit.contain),
                ),
                SizedBox(width: 8),
                Column(
                  children: [
                    Text(
                      namaTernak,
                      style: GoogleFonts.nunito(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      namaPeternakan,
                      style: GoogleFonts.nunito(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      currencyFormatter.format(hargaTernak),
                      style: GoogleFonts.nunito(),
                    ),
                    Text(
                      satuan,
                      style: GoogleFonts.nunito(),
                    )
                  ],
                ),
                Text(
                  percentageFormatter.format(change),
                  style: GoogleFonts.nunito(
                      color: change < 0
                          ? Colors.pink
                          : change > 0
                              ? Colors.green
                              : Colors.grey,
                      fontSize: 14),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
