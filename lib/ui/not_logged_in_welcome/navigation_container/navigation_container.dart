import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tokenapp/ui/book_a_bus/info_screen.dart';
import 'package:tokenapp/ui/container/about_us/about_us.dart';
import 'package:tokenapp/ui/container/contact_us/contact_us.dart';
import 'package:tokenapp/ui/container/faq/faq.dart';
import 'package:tokenapp/ui/container/home/home.dart';
import 'package:tokenapp/ui/container/lost_and_found/lost_and_found.dart';
import 'package:tokenapp/ui/container/privacy_and_concern/privacy_and_concern.dart';
import 'package:tokenapp/ui/container/refund_request_details/refund_request_details.dart';
import 'package:tokenapp/ui/container/my_bookings/my_bookings.dart';
import 'package:tokenapp/ui/container/our_service/our_service.dart';
import 'package:tokenapp/ui/container/refund_request_list/refund_request_list.dart';
import 'package:tokenapp/ui/container/terms_and_conditions/terms_and_conditions.dart';
import 'package:tokenapp/ui/navigation_container/widgets/bottom_bar_item.dart';
import 'package:tokenapp/ui/navigation_container/widgets/menu_items.dart';
import 'package:tokenapp/ui/not_logged_in_welcome/navigation_container/navigation_container_controller.dart';
import 'package:tokenapp/ui/not_logged_in_welcome/welcome/welcome_screen.dart';
import 'package:tokenapp/ui/section4/notification/notification_screen.dart';
import 'package:tokenapp/utils/colors.dart';
import 'package:tokenapp/utils/constants.dart';
import 'package:tokenapp/utils/dimens.dart';
import 'package:tokenapp/utils/spacers.dart';
import 'package:google_fonts/google_fonts.dart';

import '../profile/profile_screen.dart';

class NavigationContainer extends StatefulWidget {

  final bool showBookingScreen;

  const NavigationContainer({Key? key, this.showBookingScreen = false}) : super(key: key);

  @override
  _NavigationContainerState createState() => _NavigationContainerState();
}

class _NavigationContainerState extends State<NavigationContainer> {

  int _selectedItem = 3;

  final _controller = NavigationContainerController();

  @override
  void initState() {
    if(widget.showBookingScreen){
      _selectedItem = 4;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Scaffold(
          body: _getBody(),
          floatingActionButton: FloatingActionButton(
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [gradientDark, gradientLight],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight
                  )
              ),
              child: Center(
                child: SvgPicture.asset(
                  AssetConstants.ic_bus_svg,
                ),
              ),
            ),
            onPressed: () {
              Get.to(
                InfoScreen(),
              );
            },
            backgroundColor: accent,
          ),
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            child: Container(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BottomBarItem(
                    iconString: AssetConstants.ic_home_svg,
                    isSelected: _selectedItem == 0,
                    title: "Home",
                    index: 0,
                    onTap: _onBottomBarTap,
                  ),
                  BottomBarItem(
                    iconString: "",
                    isSelected: _selectedItem == 1,
                    title: "Book a Bus",
                    index: 1,
                    onTap: (int position){

                    },
                  ),
                  BottomBarItem(
                    iconString: AssetConstants.ic_menu_svg,
                    isSelected: _selectedItem == 2,
                    title: "Menu",
                    index: 2,
                    onTap: (int position) {
                      _controller.getUser();
                      _showMenu(constraints.maxHeight);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _onBottomBarTap(int index) {
    setState(() {
      _selectedItem = index;
    });
  }

  _showMenu(double height) {
    showModalBottomSheet(
      backgroundColor: white,
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
                  Obx((){

                    var currentState = _controller.userState.value;

                    return Padding(
                      padding: EdgeInsets.all(dp20),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: dp30,
                            backgroundImage: NetworkImage(
                             currentState==null ? "" : (currentState.image ?? ""),
                            ),
                          ),
                          HSpacer20(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                currentState?.name ?? "",
                                style: GoogleFonts.manrope(
                                  color: darkText,
                                  fontWeight: FontWeight.bold,
                                  fontSize: dp16,
                                ),
                              ),
                              Text(
                                currentState?.email ?? "",
                                style: GoogleFonts.manrope(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
                  VSpacer10(),
                  Container(
                    height: 1,
                    width: double.maxFinite,
                    color: light_grey,
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        MenuItem(
                          isSelected: 3 == _selectedItem,
                          index: 3,
                          title: "My Profile",
                          icon: AssetConstants.ic_profile_svg,
                          onClick: (index) {
                            changePage(index);
                          },
                        ),
                        MenuItem(
                          isSelected: 4 == _selectedItem,
                          index: 4,
                          title: "My Booking List",
                          icon: AssetConstants.ic_vehicle_list_svg,
                          onClick: (index) {
                            changePage(index);
                          },
                        ),
                        MenuItem(
                          isSelected: 5 == _selectedItem,
                          index: 5,
                          title: "My Refund Request",
                          icon: AssetConstants.ic_refund_request_svg,
                          onClick: (index) {
                            changePage(index);
                          },
                        ),
                        MenuItem(
                          isSelected: 6 == _selectedItem,
                          index: 6,
                          title: "Notifications",
                          icon: AssetConstants.ic_notification_svg,
                          onClick: (index) {
                            changePage(index);
                          },
                        ),
                        MenuItem(
                          isSelected: 7 == _selectedItem,
                          index: 7,
                          title: "About Us",
                          icon: AssetConstants.ic_about_us_svg,
                          onClick: (index) {
                            changePage(index);
                          },
                        ),
                        MenuItem(
                          isSelected: 8 == _selectedItem,
                          index: 8,
                          title: "Our Services",
                          icon: AssetConstants.ic_settings_svg,
                          onClick: (index) {
                            changePage(index);
                          },
                        ),
                        MenuItem(
                          isSelected: 9 == _selectedItem,
                          index: 9,
                          title: "FAQ",
                          icon: AssetConstants.ic_faq_svg,
                          onClick: (index) {
                            changePage(index);
                          },
                        ),
                        MenuItem(
                          isSelected: 10 == _selectedItem,
                          index: 10,
                          title: "Lost & Found",
                          icon: AssetConstants.ic_lost_and_found_new_svg,
                          onClick: (index) {
                            changePage(index);
                          },
                        ),
                        MenuItem(
                          isSelected: 11 == _selectedItem,
                          index: 11,
                          title: "Terms & Condition",
                          icon: AssetConstants.ic_terms_and_conditions_svg,
                          onClick: (index) {
                            changePage(index);
                          },
                        ),
                        MenuItem(
                          isSelected: 12 == _selectedItem,
                          index: 12,
                          title: "Privacy & Concern",
                          icon: AssetConstants.ic_privacy_and_concern_svg,
                          onClick: (index) {
                            print("8 is clicked?");
                            changePage(index);
                          },
                        ),
                        MenuItem(
                          isSelected: 13 == _selectedItem,
                          index: 13,
                          title: "Contact Us",
                          icon: AssetConstants.ic_contact_us_svg,
                          onClick: (index) {
                            changePage(index);
                          },
                        ),
                        MenuItem(
                          isSelected: 14 == _selectedItem,
                          index: 14,
                          title: "Sign Out",
                          icon: AssetConstants.ic_sign_out_svg,
                          onClick: (index) {
                            _controller.logoutServiceProvider().then((_){
                              Get.back();
                              Get.back();
                              Get.to(NotLoggedInWelcome());
                            });
                          },
                        ),
                        VSpacer40(),
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

  changePage(int index) {

    if (index != _selectedItem) {

      if(index != 0 && index != 1)
        Get.back();

      setState(() {
        _selectedItem = index;
      });
    }else{
      Get.back();
    }
  }

  Widget _getBody() {
    switch (_selectedItem) {
      case 0:
        return HomeView();
      case 1:
        return HomeView();
      case 2:
        return HomeView();
      case 3:
        return ProfileScreen();
      case 4:
        return MyBookingsView();
      case 5:
        return RefundRequestListView();
      case 6:
        return NotificationScreen();
      case 7:
        return AboutUsView();
      case 8:
        return OurServiceView();
      case 9:
        return FaqView();
      case 10:
        return LostAndFoundView();
      case 11:
        return TermsAndConditionsView();
      case 12:
        return PrivacyAndConcernView();
      case 13:
        return ContactUsView();
      default:
        return Container();
    }
  }
}
