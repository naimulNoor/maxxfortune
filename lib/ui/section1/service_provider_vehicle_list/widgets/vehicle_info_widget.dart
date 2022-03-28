import 'package:flutter/material.dart';
import 'package:tokenapp/ui/common_widgets/text_field_headline.dart';
import 'package:tokenapp/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class VehicleInfoWidget extends StatelessWidget {
  final String title, value;

  const VehicleInfoWidget({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFieldHeadline(
          headline: title,
        ),
        Text(
          value,
          style: GoogleFonts.manrope(
            fontWeight: FontWeight.w600,
            color: blueText,
          ),
        ),
      ],
    );
  }
}
