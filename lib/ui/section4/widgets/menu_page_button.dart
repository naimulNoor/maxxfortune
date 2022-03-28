import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tokenapp/ui/container/UIConstants/Colors.dart';
import 'package:tokenapp/ui/container/UIConstants/UISizeConstants.dart';
import 'package:tokenapp/ui/section1/service_provider_welcome/service_provider_welcome_screen.dart';
import 'package:tokenapp/utils/colors.dart';

class MenuButtonOutlineStock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: OutlinedButton(
        child: Text(
          "Service Provider Area",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              fontSize: GSFontSizes.font18),
        ),
        style: OutlinedButton.styleFrom(
          primary: GSColors.green_secondary,
          side: BorderSide(color: GSColors.green_secondary),
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(GSBorderRadius.radius8))),
          minimumSize: GSSizes.size316x56,
        ),
        onPressed: () {
          Get.back();
          Get.to(ServiceProviderWelcomeScreen());
        },
      ),
    );
  }
}
