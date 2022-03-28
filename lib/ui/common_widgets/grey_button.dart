import 'package:flutter/material.dart';
import 'package:tokenapp/utils/colors.dart';
import 'package:tokenapp/utils/dimens.dart';
import 'package:google_fonts/google_fonts.dart';

class GreyButton extends StatelessWidget {

  final String title;
  final Function? onClick;

  const GreyButton({
    Key? key,
    required this.title,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.all(dp10),
      color: Colors.grey,
      textColor: white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(dp10),
      ),
      onPressed: () {
        if(onClick!=null)
        onClick!();
      },
      child: Text(
        title,
        style: GoogleFonts.manrope(
          color: white,
          fontSize: dp20,
        ),
      ),
    );
  }
}
