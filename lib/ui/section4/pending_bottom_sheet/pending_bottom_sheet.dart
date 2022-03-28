import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tokenapp/base/widget/GSButtonWidget.dart';
import 'package:tokenapp/constants.dart';
import 'package:tokenapp/ui/container/UIConstants/Colors.dart';
import 'package:tokenapp/ui/section4/widgets/pending_button.dart';
import 'package:tokenapp/utils/colors.dart';
import 'package:tokenapp/utils/constants.dart';
import 'package:tokenapp/utils/dimens.dart';
import 'package:google_fonts/google_fonts.dart';

void modalBottomSheetMenuPending(BuildContext context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (builder) {
        return new Container(
          height: 450.0,
          color: Color(0xFF737373), //could change this to Color(0xFF737373),
          //so you don't have to change MaterialApp canvasColor
          child: new Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(20.0),
                      topRight: const Radius.circular(20.0))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SvgPicture.asset(
                    AssetConstants.successfulIcon,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Thank you",
                          style: GoogleFonts.manrope(
                            color: accent,
                            fontSize: dp25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Your request has been submitted.\n An admin will approve your request soon.",
                          style: GoogleFonts.manrope(
                            color: GSColors.text_secondary,
                            fontSize: dp14,
                            fontWeight: FontWeight.normal,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: GSButton(
                      text: "Go to Profile",
                      onClick: () {
                        Get.back();
                        Get.back();
                      },
                    ),
                  ),
                ],
              )),
        );
      });
}
