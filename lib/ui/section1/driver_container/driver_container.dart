import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tokenapp/ui/navigation_container/widgets/bottom_bar_item.dart';
import 'package:tokenapp/ui/notification/notification_screen.dart';
import 'package:tokenapp/ui/section1/driver_login/driver_login_controller.dart';
import 'package:tokenapp/ui/section1/profile/profile_screen_page.dart';
import 'package:tokenapp/utils/constants.dart';

class DriverContainer extends StatefulWidget {
  const DriverContainer({Key? key}) : super(key: key);

  @override
  _DriverContainerState createState() => _DriverContainerState();
}

class _DriverContainerState extends State<DriverContainer> {

  int _selectedItem = 0;

  final _controller = DriverLoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(),
      bottomNavigationBar: BottomAppBar(
      child: Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomBarItem(
            iconString: AssetConstants.ic_profile_svg,
            isSelected: _selectedItem == 0,
            title: "Profile",
            index: 0,
            onTap: _onBottomBarTap,
          ),
          BottomBarItem(
            iconString: AssetConstants.ic_vehicle_list_svg,
            isSelected: _selectedItem == 1,
            title: "Child List",
            index: 1,
            onTap: _onBottomBarTap,
          ),
          BottomBarItem(
            iconString: AssetConstants.ic_sign_out_svg,
            isSelected: _selectedItem == 2,
            title: "Sign Out",
            index: 2,
            onTap: (int position) {
              _controller.signOut().then((value){
                Get.back();
              });
            },
          ),
        ],
      ),
    ),
    ),
    );
  }

  void _onBottomBarTap(int index) {
    setState(() {
      _selectedItem = index;
    });
  }
  Widget _getBody() {
    switch (_selectedItem) {
      case 0:
        return ProfileScreenPage();
      case 1:
        return NotificationScreenPage();
      default:
        return Container();
    }
  }


}
