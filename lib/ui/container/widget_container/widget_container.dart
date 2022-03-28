import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tokenapp/ui/book_a_bus/info_screen.dart';
import 'package:tokenapp/ui/container/UIConstants/Colors.dart';
import 'package:tokenapp/ui/container/about_us/about_us.dart';
import 'package:tokenapp/ui/container/contact_us/contact_us.dart';
import 'package:tokenapp/ui/container/faq/faq.dart';
import 'package:tokenapp/ui/container/home/home.dart';
import 'package:tokenapp/ui/container/lost_and_found/lost_and_found.dart';
import 'package:tokenapp/ui/container/our_service/our_service.dart';
import 'package:tokenapp/ui/container/privacy_and_concern/privacy_and_concern.dart';
import 'package:tokenapp/ui/container/terms_and_conditions/terms_and_conditions.dart';
import 'package:tokenapp/ui/container/widget_container/widget_container_controller.dart';
import 'package:tokenapp/ui/navigation_container/widgets/bottom_bar_item.dart';
import 'package:tokenapp/ui/navigation_container/widgets/menu_items.dart';
import 'package:tokenapp/ui/not_logged_in_welcome/navigation_container/navigation_container.dart';
import 'package:tokenapp/ui/not_logged_in_welcome/welcome/welcome_screen.dart';
import 'package:tokenapp/ui/section1/driver_login/driver_login_screen.dart';
import 'package:tokenapp/ui/section4/widgets/menu_page_button.dart';
import 'package:tokenapp/utils/colors.dart';
import 'package:tokenapp/utils/constants.dart';
import 'package:tokenapp/utils/dimens.dart';
import 'package:tokenapp/utils/spacers.dart';
import 'package:tokenapp/utils/string_utils.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetContainerView extends StatefulWidget {
  const WidgetContainerView({Key? key}) : super(key: key);

  @override
  _WidgetContainerViewState createState() => _WidgetContainerViewState();
}

class _WidgetContainerViewState extends State<WidgetContainerView> {
  late Widget body;
  late int selectedBottomBarIndex;
  var hp;

  final _controller = WidgetContainerController();

  @override
  void initState() {
    super.initState();

    body = HomeView();
    selectedBottomBarIndex = 0;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    hp = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: GSColors.green_secondary,
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
      ),
      body: body,

      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomBarItem(
                iconString: AssetConstants.ic_home_svg,
                isSelected: selectedBottomBarIndex == 0,
                title: "Home",
                index: 0,
                onTap: _changeBottomBarIndex,
              ),
              BottomBarItem(
                iconString: "",
                isSelected: selectedBottomBarIndex == 1,
                title: "Book a Bus",
                index: 1,
                onTap: (int position){

                },
              ),
              BottomBarItem(
                iconString: AssetConstants.ic_menu_svg,
                isSelected: selectedBottomBarIndex == 2,
                title: "Menu",
                index: 2,
                onTap: (int position) {
                  _controller.getUser();
                  showMenuBottomSheet(hp, context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem getBottomBarItem(
    String imagePath,
    String title,
    int position,
  ) {
    return BottomNavigationBarItem(
      icon: imagePath.trim().isNotEmpty
          ? Image.asset(
              imagePath,
              fit: BoxFit.fitHeight,
              height: 32.0,
            )
          : SizedBox(height: 33.0),
      label: title,
    );
  }

  void _changeBottomBarIndex(int index) {
    if (index >= 3) Get.back();

    setState(() {
      selectedBottomBarIndex = index;

      switch (index) {
        case 0:
          body = HomeView();
          break;

        case 1:
          body = AboutUsView();
          break;

        case 3:
          body = AboutUsView();
          break;

        case 4:
          body = OurServiceView();
          break;

        case 5:
          body = FaqView();
          break;

        case 6:
          body = LostAndFoundView();
          break;

        case 7:
          body = TermsAndConditionsView();
          break;

        case 8:
          body = PrivacyAndConcernView();
          break;

        case 9:
          body = ContactUsView();
          break;

        default:
          break;
      }
    });
  }

  showMenuBottomSheet(double height, BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
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
                    return InkWell(
                      onTap: (){
                        if(currentState!=null){
                          Get.back();
                          Get.to(NavigationContainer());
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.all(dp20),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: dp30,
                              backgroundImage: NetworkImage(
                                currentState==null ? "" : getImagePath(currentState.image ?? ""),
                              ),
                            ),
                            HSpacer20(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  currentState==null ? "No user logged in" : currentState.name,
                                  style: GoogleFonts.manrope(
                                    color: darkText,
                                    fontWeight: FontWeight.bold,
                                    fontSize: dp16,
                                  ),
                                ),
                                currentState==null ? InkWell(
                                  onTap: (){
                                    Get.back();
                                    Get.to(
                                      NotLoggedInWelcome(),
                                    );
                                  },
                                  child: Text(
                                    "Tap to login",
                                    style: GoogleFonts.manrope(),
                                  ),
                                ) :  Text(
                                  currentState.email,
                                  style: GoogleFonts.manrope(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                  Expanded(
                    child: ListView(
                      children: [
                        MenuItem(
                          isSelected: 3 == selectedBottomBarIndex,
                          index: 3,
                          title: "About Us",
                          icon: AssetConstants.ic_about_us_svg,
                          onClick: (index) {
                            _changeBottomBarIndex(index);
                          },
                        ),
                        MenuItem(
                          isSelected: 4 == selectedBottomBarIndex,
                          index: 4,
                          title: "Our Services",
                          icon: AssetConstants.ic_menu_service,
                          onClick: (index) {
                            _changeBottomBarIndex(index);
                          },
                        ),
                        MenuItem(
                          isSelected: 5 == selectedBottomBarIndex,
                          index: 5,
                          title: "FAQ",
                          icon: AssetConstants.ic_faq_svg,
                          onClick: (index) {
                            _changeBottomBarIndex(index);
                          },
                        ),
                        MenuItem(
                          isSelected: 6 == selectedBottomBarIndex,
                          index: 6,
                          title: "Lost & Found",
                          icon: AssetConstants.ic_lost_and_found_new_svg,
                          onClick: (index) {
                            _changeBottomBarIndex(index);
                          },
                        ),
                        MenuItem(
                          isSelected: 7 == selectedBottomBarIndex,
                          index: 7,
                          title: "Terms & Condition",
                          icon: AssetConstants.ic_tc_svg,
                          onClick: (index) {
                            _changeBottomBarIndex(index);
                          },
                        ),
                        MenuItem(
                          isSelected: 8 == selectedBottomBarIndex,
                          index: 8,
                          title: "Privacy & Concern",
                          icon: AssetConstants.ic_privacy_and_concern_svg,
                          onClick: (index) {
                            print("8 is clicked?");
                            _changeBottomBarIndex(index);
                          },
                        ),
                        MenuItem(
                          isSelected: 9 == selectedBottomBarIndex,
                          index: 9,
                          title: "Contact Us",
                          icon: AssetConstants.ic_contact_us_svg,
                          onClick: (index) {
                            _changeBottomBarIndex(index);
                          },
                        ),
                        MenuItem(
                          isSelected: 10 == selectedBottomBarIndex,
                          index: 10,
                          title: "Driver Login",
                          icon: AssetConstants.ic_driver_login_svg,
                          onClick: (index) {
                            Get.back();
                            Get.to(
                                DriverLoginScreen(),
                            );
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
}
