import 'package:flutter/material.dart';
import 'package:tokenapp/constants.dart';
import 'package:tokenapp/ui/container/UIConstants/UISizeConstants.dart';
import 'package:tokenapp/utils/colors.dart';
import 'package:tokenapp/utils/dimens.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFontStyle {
  static final headerTitle =TextStyle(
    fontSize: 24,
    color: colortitle,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontFamily:'.SF UI Display'
  );

  static final subHeaderTitle =TextStyle(
      fontSize: 12,
      color: colorsubtitle,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily:'.SF UI Display'
  );

  static final buttontext =TextStyle(
      fontSize: 14,
      color: colorsubtitle,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontFamily:'.SF UI Display'
  );

  static final headerhinttitle =TextStyle(
      fontSize: 12,
      color: colorsubtitle,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontFamily:'.SF UI Display'
  );

  static final style_edittext_hint =TextStyle(
      fontSize: 12,
      color: colorhint,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontFamily:'.SF UI Display'
  );
  static final style_edittext_label =TextStyle(
      fontSize: 15,
      color: colorhint,
      fontWeight: FontWeight.w300,
      fontStyle: FontStyle.normal,
      fontFamily:'.SF UI Display'
  );



  static final style_otp_field =TextStyle(
      fontSize: 24,
      color: colortitle,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontFamily:'.SF UI Display'
  );

  static TextStyle style_edittext({Color color = Colors.white}) {
    return TextStyle(
      color: color,
      fontSize: GSFontSizes.font18,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle style_faq_details({Color color = Colors.white}) {
    return TextStyle(
      color: color,
      fontSize: GSFontSizes.font14,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
        fontFamily:'.SF UI Display'
    );
  }

  static TextStyle style_faq_header({Color color = Colors.white}) {
    return TextStyle(
      color: color,
      fontSize: GSFontSizes.font16,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
        fontFamily:'.SF UI Display'
    );
  }






}