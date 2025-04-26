import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabElement extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const TabElement(
      {super.key,
      required this.text,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.only(bottom: 2),
          decoration: BoxDecoration(
              border: BorderDirectional(
                  bottom: BorderSide(
                      width: 2,
                      color: isSelected
                          ? Color(0xFF90BA3E)
                          : Colors.transparent))),
          child: Text(
            text,
            style: GoogleFonts.nunito(
              textStyle: TextStyle(
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? Color(0xFF90BA3E) : Color(0xFF515151),
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
