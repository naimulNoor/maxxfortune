import 'package:flutter/material.dart';
import 'package:tokenapp/utils/colors.dart';
import 'package:tokenapp/utils/dimens.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateButton extends StatelessWidget {
  final String text;
  final Function() onClicked;

  const UpdateButton({required this.text, required this.onClicked});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.all(dp10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            dp10,
          ),
        ),
        side: BorderSide(color: accent),
      ),
      onPressed: onClicked,
      child: Text(
        text,
        style: GoogleFonts.manrope(
          color: accent,
        ),
      ),
    );
  }
}
