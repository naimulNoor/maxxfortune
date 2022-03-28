import 'package:flutter/material.dart';
import 'package:tokenapp/constants.dart';
import 'package:tokenapp/ui/container/UIConstants/UISizeConstants.dart';

class PendingButton extends StatelessWidget {
  String text;
  Function? onClick;

  PendingButton({required this.text, this.onClick});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: GSFontSizes.font18),
      ),
      style: OutlinedButton.styleFrom(
          primary: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(GSBorderRadius.radius8))),
          backgroundColor: colorPending,
          minimumSize: GSSizes.size316x56),
      onPressed: () {
        print('Pressed');
        if (onClick != null) onClick!();
      },
    );
  }
}
