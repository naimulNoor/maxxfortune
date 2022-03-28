import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tokenapp/base/widget/GSButtonWidget.dart';
import 'package:tokenapp/base/widget/GSTextField.dart';
import 'package:tokenapp/data/models/driver/driver_login_request.dart';
import 'package:tokenapp/ui/container/UIConstants/GSWidgetStyles.dart';
import 'package:tokenapp/ui/container/UIConstants/Strings.dart';
import 'package:tokenapp/ui/container/UIConstants/UISizeConstants.dart';
import 'package:tokenapp/ui/section1/driver_container/driver_container.dart';
import 'package:tokenapp/ui/section1/driver_login/driver_login_controller.dart';
import 'package:tokenapp/utils/spacers.dart';

class DriverLoginScreen extends StatefulWidget {
  @override
  _DriverLoginScreenState createState() => _DriverLoginScreenState();
}

class _DriverLoginScreenState extends State<DriverLoginScreen> {
  bool value = false;
  final vehicleNumberController = TextEditingController();
  final passwordController = TextEditingController();

  final _controller = DriverLoginController();

  @override
  void initState() {
    super.initState();

    _controller.isLoggedIn().then((value){
      if(value) Get.off(DriverContainer());
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: GSSizes.size278h,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "images/signup_bg.png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: GSSizeConstants.padding120,
                  ),

                  //Get start text
                  Text(
                    "Driver Login",
                    textAlign: TextAlign.start,
                    style: GSTextStyles.make28xw600Style(),
                  ),

                  SizedBox(
                    height: GSSizeConstants.padding7,
                  ),

                  // Description test
                  Container(
                      width: 256,
                      child: Center(
                          child: Text(
                        "It’s time to rock n role! Let’s get started now.",
                        style: GSTextStyles.make18xw400Style(),
                        textAlign: TextAlign.center,
                      ))),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: GSSizeConstants.padding55,
                    ),
                    GSTextField(
                        controller: vehicleNumberController,
                        hints: "Vehicle Number"),
                    SizedBox(
                      height: GSSizeConstants.padding17,
                    ),
                    GSPasswordTextField(
                      controller: passwordController,
                    ),
                    /*Container(
                          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                          child: Row(
                            children: [
                              CustomCheckBox(
                                value: value,
                                shouldShowBorder: true,
                                borderColor: Colors.white,
                                uncheckedFillColor: Colors.grey,
                                checkedFillColor: GSColors.green_normal,
                                borderRadius: 2,
                                borderWidth: 1,
                                checkBoxSize: 15,
                                uncheckedIconColor: Colors.transparent,
                                onChanged: (val) {
                                  //do your stuff here
                                  setState(() {
                                    value = val;
                                  });
                                },
                              ),
                              Text(
                                "Keep me signed in",
                                style: GoogleFonts.manrope(
                                  color: grey,
                                  fontSize: dp18,
                                  fontWeight: FontWeight.normal,
                                ),
                              )
                            ],
                          ),
                        ),*/
                    // SizedBox(height: 10,),
                    // Align(
                    //     child: Text("Forget Password ? Reset Here")),
                    VSpacer40(),
                    GSButton(
                      text: GSStrings.sign_in,
                      onClick: () {
                        var request = DriverLoginRequest(
                          vehicleNumber: vehicleNumberController.text,
                          password: passwordController.text,
                        );
                        login(request);
                      },
                    ),
                    SizedBox(
                      height: GSSizeConstants.padding7,
                    ),
                    SizedBox(
                      height: GSSizeConstants.padding7,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  login(DriverLoginRequest request) async{
    var response = await _controller.loginDriver(request);

    if(response.data != null){
      if(response.data!.token != null)
      await _controller.storeToken(response.data!.token!);
      Get.off(DriverContainer());
    }

  }

}
