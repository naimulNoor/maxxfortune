import 'package:flutter/material.dart';
import 'package:tokenapp/ui/navigation_container/widgets/menu_items.dart';
import 'package:tokenapp/ui/section4/widgets/menu_page_button.dart';
import 'package:tokenapp/utils/colors.dart';
import 'package:tokenapp/utils/constants.dart';
import 'package:tokenapp/utils/dimens.dart';
import 'package:tokenapp/utils/spacers.dart';
import 'package:google_fonts/google_fonts.dart';

int _selectedItem = 5;
showMenuBottomSheet(double height, BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(dp20),
        topRight: Radius.circular(dp20),
      ),
    ),
    context: context,
    builder: (context) {
      return Wrap(
        children: [
          Container(
            height: height - 100,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(dp20),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: dp30,
                        backgroundImage: NetworkImage(
                          "https://images.unsplash.sg/photo-1563306406-e66174fa3787",
                        ),
                      ),
                      HSpacer20(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "No user logged in",
                            style: GoogleFonts.manrope(
                              color: darkText,
                              fontWeight: FontWeight.bold,
                              fontSize: dp16,
                            ),
                          ),
                          Text(
                            "Tap to login",
                            style: GoogleFonts.manrope(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      MenuItem(
                        isSelected: 1 == _selectedItem,
                        index: 1,
                        title: "About Us",
                        icon: AssetConstants.ic_profile_svg,
                        onClick: (index) {
                          //changePage(index);
                        },
                      ),
                      MenuItem(
                        isSelected: 2 == _selectedItem,
                        index: 2,
                        title: "Our Services",
                        icon: AssetConstants.ic_vehicle_list_svg,
                        onClick: (index) {
                          //changePage(index);
                        },
                      ),
                      MenuItem(
                        isSelected: 3 == _selectedItem,
                        index: 3,
                        title: "FAQ",
                        icon: AssetConstants.ic_free_busy_list_svg,
                        onClick: (index) {
                          //changePage(index);
                        },
                      ),
                      MenuItem(
                        isSelected: 4 == _selectedItem,
                        index: 4,
                        title: "Lost & Found",
                        icon: AssetConstants.lostandFoundIcon,
                        onClick: (index) {
                          //changePage(index);
                        },
                      ),
                      MenuItem(
                        isSelected: 5 == _selectedItem,
                        index: 5,
                        title: "Terms & Condition",
                        icon: AssetConstants.ic_notification_svg,
                        onClick: (index) {
                          //changePage(index);
                        },
                      ),
                      MenuItem(
                        isSelected: 6 == _selectedItem,
                        index: 6,
                        title: "Privacy & Concern",
                        icon: AssetConstants.ic_settings_svg,
                        onClick: (index) {
                          //changePage(index);
                        },
                      ),
                      MenuItem(
                        isSelected: 7 == _selectedItem,
                        index: 7,
                        title: "Contact Us",
                        icon: AssetConstants.ic_sign_out_svg,
                        onClick: (index) {
                          //changePage(index);
                        },
                      ),
                      MenuButtonOutlineStock(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}
