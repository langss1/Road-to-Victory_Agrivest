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

    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            border: Border.all(
                color: isSelected ? Color(0xFF90BA3E) : Color(0xFFE9E9E9),
                width: isSelected ? 2 : 1)),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      imgPath,
                      fit: BoxFit.contain,
                      height: 28,
                    ),
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        namaTernak,
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Color(0xFF252525),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        namaPeternakan,
                        style: GoogleFonts.nunito(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF6D6D6D),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  )
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Text(
                      currencyFormatter.format(hargaTernak),
                      style: GoogleFonts.nunito(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Color(0xFF252525),
                      ),
                    ),
                    Text(
                      satuan,
                      style: GoogleFonts.nunito(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF252525),
                      ),
                    )
                  ],
                ),
                Text(
                  percentageFormatter.format(change),
                  style: GoogleFonts.nunito(
                      color: change < 0
                          ? Colors.pink
                          : change > 0
                              ? Color(0xFF90BA3E)
                              : Color(0xFFE9E9E9),
                      fontSize: 14),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
