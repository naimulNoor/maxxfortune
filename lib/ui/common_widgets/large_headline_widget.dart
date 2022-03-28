import 'package:flutter/material.dart';
import 'package:tokenapp/utils/colors.dart';
import 'package:tokenapp/utils/dimens.dart';
import 'package:google_fonts/google_fonts.dart';

class LargeHeadlineWidget extends StatelessWidget {

  final String headline;

  const LargeHeadlineWidget({required this.headline});

  @override
  Widget build(BuildContext context) {
    return Text(
      headline,
      style: GoogleFonts.manrope(
        color: darkText,
        fontSize: dp25,
        fontWeight: FontWeight.bold,
      )
    );
  }
}
