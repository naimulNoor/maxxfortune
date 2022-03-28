import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tokenapp/ui/container/UIConstants/Colors.dart';
import 'package:tokenapp/ui/container/UIConstants/Fonts.dart';
import 'package:tokenapp/ui/container/UIConstants/GSWidgetStyles.dart';
import 'package:tokenapp/ui/container/UIConstants/Strings.dart';
import 'package:tokenapp/ui/container/UIConstants/UISizeConstants.dart';

import 'HorizontalDashLine.dart';

class GSTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.location_on_outlined,
              color: GSColors.green_primary,
            ),
            SizedBox(
              width: GSSizeConstants.padding12,
            ),
            Text(
              GSStrings.pickup_point,
              style: GSTextStyles.make14xw400Style(
                color: GSColors.gray_primary,
                fontFamily: GSFonts.appFont,
              ),
            )
          ],
        ),
        Padding(
            padding: EdgeInsets.only(left: GSSizeConstants.padding26),
            child: Container(
              padding: EdgeInsets.only(
                  left: GSSizeConstants.padding10,
                  top: GSSizeConstants.padding6),
              decoration: BoxDecoration(
                  border: Border(left: BorderSide(style: BorderStyle.none))),
              //child:Text("Block 372 Bukit Batok Street 31.", style: GSTextStyles.make16xw500Style(),))
              child: CustomPaint(
                  size: Size(1, double.infinity),
                  painter: DashedLineVerticalPainter()),
            ))
      ],
    );
  }
}
