import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tokenapp/utils/colors.dart';
import 'package:tokenapp/utils/dimens.dart';
import 'package:tokenapp/utils/spacers.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuItem extends StatelessWidget {

  final bool isSelected;
  final int index;
  final String title;
  final String icon;
  final Function(int index) onClick;

  const MenuItem({
    required this.isSelected,
    required this.index,
    required this.title,
    required this.icon,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onClick(index);
      },
      child: Container(
        color: isSelected ? accent.withOpacity(0.1) : white,
        padding: EdgeInsets.all(dp20),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              height: dp25,
              width: dp25,
              color: isSelected ? accent : menuItemColor,
            ),
            HSpacer20(),
            Text(
              title,
              style: GoogleFonts.manrope(
                color: isSelected ? accent : menuItemColor
              ),
            )
          ],
        ),
      ),
    );
  }
}
