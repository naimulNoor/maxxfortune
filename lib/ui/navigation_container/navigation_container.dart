import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tokenapp/ui/navigation_container/navigation_container_controller.dart';
import 'package:tokenapp/ui/section1/service_provider_add_vehicle/service_provider_add_vehicle.dart';
import 'package:tokenapp/ui/section1/service_provider_profile/service_provider_profile_controller.dart';
import 'package:tokenapp/ui/section1/service_provider_welcome/service_provider_welcome_screen.dart';
import 'package:tokenapp/ui/container/home/home.dart';
import 'package:tokenapp/ui/navigation_container/widgets/bottom_bar_item.dart';
import 'package:tokenapp/ui/navigation_container/widgets/menu_items.dart';
import 'package:tokenapp/ui/section1/driver_login/driver_login_screen.dart';
import 'package:tokenapp/ui/section1/service_provider_profile/service_provider_profile_screen.dart';
import 'package:tokenapp/ui/section1/service_provider_vehicle_free_busy_list/service_provider_vehicle_free_busy_list.dart';
import 'package:tokenapp/ui/section1/service_provider_vehicle_list/service_provider_vehicle_list.dart';
import 'package:tokenapp/ui/section1/service_providerreset_vehicle_login/service_provider_reset_vehicle_list.dart';
import 'package:tokenapp/ui/section4/notification/notification_screen.dart';
import 'package:tokenapp/utils/colors.dart';
import 'package:tokenapp/utils/constants.dart';
import 'package:tokenapp/utils/dimens.dart';
import 'package:tokenapp/utils/spacers.dart';
import 'package:tokenapp/utils/string_utils.dart';
import 'package:google_fonts/google_fonts.dart';

class NavigationContainer extends StatefulWidget {
  const NavigationContainer({Key? key}) : super(key: key);

  @override
  _NavigationContainerState createState() => _NavigationContainerState();
}

class _NavigationContainerState extends State<NavigationContainer> {
  int _selectedItem = 3;

  final _controller = NavigationContainerController();
  final ServiceProviderProfileController _profileController = Get.find();

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
              Get.to(ServiceProviderAddVehicleScreen());
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
                    title: "Add a Bus",
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
                  _userInfo(),
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
                          title: "My Vehicle List",
                          icon: AssetConstants.ic_vehicle_list_svg,
                          onClick: (index) {
                            changePage(index);
                          },
                        ),
                        MenuItem(
                          isSelected: 5 == _selectedItem,
                          index: 5,
                          title: "Vehicle Free Busy List",
                          icon: AssetConstants.ic_free_busy_list_svg,
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
                          title: "Reset Vehicle Login",
                          icon: AssetConstants.ic_settings_svg,
                          onClick: (index) {
                            changePage(index);
                          },
                        ),
                        MenuItem(
                          isSelected: 9 == _selectedItem,
                          index: 9,
                          title: "Driver Login",
                          icon: AssetConstants.ic_driver_login_svg,
                          onClick: (index) {
                            Get.back();
                            Get.to(
                              DriverLoginScreen(),
                            );
                          },
                        ),
                        MenuItem(
                          isSelected: 8 == _selectedItem,
                          index: 8,
                          title: "Sign Out",
                          icon: AssetConstants.ic_sign_out_svg,
                          onClick: (index) {
                            _controller.logoutServiceProvider().then((_){
                              Get.back();
                              Get.back();
                              Get.to(ServiceProviderWelcomeScreen());
                            });
                          },
                        ),
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

  _userInfo(){
    return Padding(
      padding: EdgeInsets.all(dp20),
      child: Obx((){

        var profileResponse = _profileController.profileResponse.value;

        if(profileResponse== null) return Container();
        else  {
          if(profileResponse.data == null) return Container();
          else return Row(
            children: [
              CircleAvatar(
                radius: dp30,
                backgroundImage: NetworkImage(
                  getImagePath(profileResponse.data!.image),
                ),
              ),
              HSpacer20(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    profileResponse.data!.name,
                    style: GoogleFonts.manrope(
                      color: darkText,
                      fontWeight: FontWeight.bold,
                      fontSize: dp16,
                    ),
                  ),
                  Text(
                    profileResponse.data!.email,
                    style: GoogleFonts.manrope(),
                  ),
                ],
              ),
            ],
          );
        }
      }),
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
        return ServiceProviderAddVehicleScreen();
      case 2:
        return ServiceProviderProfileScreen();
      case 3:
        return ServiceProviderProfileScreen();
      case 4:
        return ServiceProviderVehicleList();
      case 5:
        return ServiceProviderVehicleFreeBusyList();
      case 6:
        return NotificationScreen();
      case 7:
        return ResetVehicleList();
      default:
        return Container();
    }
  }
}
