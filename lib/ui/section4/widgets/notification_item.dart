import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tokenapp/constants.dart';
import 'package:tokenapp/ui/container/UIConstants/Colors.dart';
import 'package:tokenapp/ui/container/UIConstants/UISizeConstants.dart';
import 'package:tokenapp/ui/section4/pending_bottom_sheet/pending_bottom_sheet.dart';
import 'package:tokenapp/ui/section4/show_menu/show_menu_bottom_sheet.dart';
import 'package:tokenapp/ui/section4/successful_bottom_sheet/successful_bottom_sheet.dart';
import 'package:tokenapp/utils/constants.dart';
import 'package:tokenapp/utils/dimens.dart';
import 'package:google_fonts/google_fonts.dart';

class Sec4NotificationItem extends StatelessWidget {
  int type;
  int condition;
  String msg;
  String datetime;
  Sec4NotificationItem(
      {this.type = 1,
      this.condition = 1,
      this.msg = "",
      required this.datetime});

  //const Sec4NotificationItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //modalBottomSheetMenuSuccess(context);
        //modalBottomSheetMenuPending(context);
        showMenuBottomSheet(MediaQuery.of(context).size.height, context);
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: SvgPicture.asset(
                            type == 1
                                ? AssetConstants.adminNoticeIcon
                                : type == 2
                                    ? AssetConstants.vehicleIcon
                                    : type == 3
                                        ? AssetConstants.billingIcon
                                        : AssetConstants.billingIcon,
                          ),
                        ),
                        Text(
                          type == 1
                              ? "Admin Notice"
                              : type == 2
                                  ? "Vehicle"
                                  : type == 3
                                      ? "Billing"
                                      : "Billing",
                          style: GoogleFonts.manrope(
                            color: GSColors.gray_secondary,
                            fontSize: dp15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: condition == 1
                            ? GSColors.green_light
                            : condition == 2
                                ? colorPending.withOpacity(0.2)
                                : condition == 3
                                    ? Colors.red[100]
                                    : Colors.red[100],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: GSSizeConstants.padding12,
                          vertical: GSSizeConstants.padding2),
                      child: Text(
                        condition == 1
                            ? "Successful"
                            : condition == 2
                                ? "Processing"
                                : condition == 3
                                    ? "Fail"
                                    : "Fail",
                        style: GoogleFonts.manrope(
                          color: condition == 1
                              ? GSColors.green_primary
                              : condition == 2
                                  ? colorPending
                                  : condition == 3
                                      ? Colors.red[800]
                                      : Colors.red[800],
                          fontSize: dp14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  msg,
                  style: GoogleFonts.manrope(
                    color: GSColors.gray_primary,
                    fontSize: dp16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  datetime,
                  style: GoogleFonts.manrope(
                    color: GSColors.gray_normal,
                    fontSize: dp14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 0.8,
          ),
        ],
      ),
    );
  }
}
