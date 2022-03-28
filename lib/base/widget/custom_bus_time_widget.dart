import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tokenapp/base/widget/custom_filled_button.dart';
import 'package:tokenapp/ui/book_a_bus/info_screen.dart';
import 'package:tokenapp/ui/container/UIConstants/Colors.dart';
import 'package:tokenapp/ui/container/UIConstants/Fonts.dart';
import 'package:tokenapp/ui/container/UIConstants/GSWidgetStyles.dart';
import 'package:tokenapp/ui/container/UIConstants/Strings.dart';

class CustomBusTimeWidget extends StatelessWidget {
  final String backgroundImagePath;
  final String title, subtitle;
  final String moneyOne, moneyTwo, moneyThree;
  final String distanceOne, distanceTwo, distanceThree;

  const CustomBusTimeWidget({
    Key? key,
    required this.backgroundImagePath,
    this.title = "Peak Hour",
    this.subtitle = "7.15 AM -  8.15 AM",
    this.moneyOne = "\$15",
    this.moneyTwo = "\$18",
    this.moneyThree = "\$21",
    this.distanceOne = "3 Km (Max)",
    this.distanceTwo = "3 km - 8km",
    this.distanceThree = "8km +",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 410,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 245.0,
            width: double.maxFinite,
            child: Image.asset(
              this.backgroundImagePath,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 260.0,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(6.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              this.title,
                              textAlign: TextAlign.start,
                              style: GSTextStyles.make20xw700Style(),
                            ),
                            Text(
                              this.subtitle,
                              textAlign: TextAlign.start,
                              style: GSTextStyles.make14xw400Style(
                                color: GSColors.text_bold,
                                fontFamily: GSFonts.appFont,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Divider(
                                color: GSColors.gray_normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TravelPackWidget(
                              title: moneyOne,
                              subtitle: distanceOne,
                            ),
                            TravelPackWidget(
                              title: moneyTwo,
                              subtitle: distanceTwo,
                            ),
                            TravelPackWidget(
                              title: moneyThree,
                              subtitle: distanceThree,
                            ),
                          ],
                        ),
                      ),
                      CustomFilledButton(
                        margin: const EdgeInsets.only(
                          top: 16.0,
                        ),
                        borderRadius: 8.0,
                        borderColor: GSColors.green_normal,
                        backgroundColor: Colors.transparent,
                        textColor: GSColors.green_normal,
                        title: GSStrings.book_now,
                        onTap: () {
                          Get.to(
                            InfoScreen(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TravelPackWidget extends StatelessWidget {
  const TravelPackWidget({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: Text(
            this.title,
            textAlign: TextAlign.start,
            style: GSTextStyles.make18xw700Style(
              color: GSColors.text_regular,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        Text(
          this.subtitle,
          textAlign: TextAlign.start,
          style: GSTextStyles.make14xw400Style(
            color: GSColors.gray_secondary,
            fontFamily: GSFonts.appFont,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ],
    );
  }
}
