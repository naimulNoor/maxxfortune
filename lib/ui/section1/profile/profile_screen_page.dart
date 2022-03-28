import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tokenapp/core/ui/error_screen.dart';
import 'package:tokenapp/core/ui/loading_widget.dart';
import 'package:tokenapp/ui/common_widgets/update_button.dart';
import 'package:tokenapp/ui/section1/driver_reset_password/reset_password_request_screen.dart';
import 'package:tokenapp/ui/section1/profile/driver_profile_controller.dart';
import 'package:tokenapp/ui/section1/service_providerreset_vehicle_login/service_provider_reset_vehicle_login_screen.dart';
import 'package:tokenapp/utils/colors.dart';
import 'package:tokenapp/utils/dimens.dart';
import 'package:tokenapp/utils/spacers.dart';
import 'package:tokenapp/utils/string_utils.dart';

class ProfileScreenPage extends StatefulWidget {
  const ProfileScreenPage({Key? key}) : super(key: key);

  @override
  _ProfileScreenPageState createState() => _ProfileScreenPageState();
}

class _ProfileScreenPageState extends State<ProfileScreenPage> {
  var hp, wp;

  final _controller = DriverProfileController();

  @override
  void initState() {
    _controller.getDriverProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    hp = MediaQuery.of(context).size.height;
    wp = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body:Obx((){

        var response = _controller.driverProfile.value;

        if(response==null){
          return LoadingWidget();
        }else {
          if (response.data == null) {
            return Center(
              child: Text(
                "Error from server"
              ),
            );
          }else
            return Container(
            height: hp,
            width: wp,
            color: white,
            padding: EdgeInsets.symmetric(horizontal: dp15, vertical: dp15),
            child: Column(
              children: [
                VSpacer60(),
                VSpacer60(),
                CircleAvatar(
                  radius: dp60,
                  backgroundImage: NetworkImage(
                    getImagePath(response.data!.image),
                  ),
                ),
                SizedBox(height: dp40),
                Text('Bus No'),
                SizedBox(height: dp10),
                Text(
                  response.data!.vehicleNumber,
                  style: TextStyle(
                      color: black,
                      fontWeight: FontWeight.bold,
                      fontSize: dp18),
                ),
                SizedBox(height: dp40),
                Text(
                  response.data!.driverName,
                  style: TextStyle(
                      color: black,
                      fontWeight: FontWeight.bold,
                      fontSize: dp20),
                ),
                SizedBox(height: dp10),
                // Text(
                //   'bayer_martin@yahoo.com',
                //   style: TextStyle(fontSize: dp18),
                // ),
                SizedBox(height: dp40),
                Text('Attendant Name'),
                SizedBox(height: dp10),
                Text(
                  response.data!.attendantName,
                  style: TextStyle(
                      color: black,
                      fontWeight: FontWeight.bold,
                      fontSize: dp18),
                ),
                SizedBox(height: dp40),
                Row(
                  children: [
                    Expanded(child: UpdateButton(
                        text: 'Change Password', onClicked: () {
                      Get.to(
                          ResetPasswordRequestScreen()
                      );
                    })),
                  ],
                )
              ],
            ),
          );
        }
      }),
    );
  }
}
