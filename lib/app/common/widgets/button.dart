import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  final String text;
  final bool isFilled;
  final String sizeCategory;

  final VoidCallback? onTap;
  final bool isActive;

  const Button(
      {super.key,
      required this.text,
      required this.sizeCategory,
      this.isFilled = false,
      this.isActive = false,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
      onTap: isActive ? onTap : null,
      child: Container(
        padding: sizeCategory == 'Small'
            ? EdgeInsets.symmetric(horizontal: 24, vertical: 8)
            : EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                width: isActive && isFilled ? 2 : 1,
                color: isActive && isFilled ? Colors.green : Colors.grey),
            color: isActive && isFilled
                ? Colors.green
                : isActive
                    ? null
                    : Colors.grey),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.nunito(
                color: isActive && isFilled
                    ? Colors.white
                    : isActive
                        ? Colors.grey
                        : Colors.white,
                fontWeight: sizeCategory == 'Large' || isFilled
                    ? FontWeight.bold
                    : FontWeight.normal,
                fontSize: 14),
          ),
        ),
      ),
    ));
  }
}
