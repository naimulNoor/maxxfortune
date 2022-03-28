import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tokenapp/base/widget/GSButtonWidget.dart';
import 'package:tokenapp/ui/container/UIConstants/Colors.dart';
import 'package:tokenapp/ui/container/UIConstants/Strings.dart';
import 'package:tokenapp/ui/container/UIConstants/UISizeConstants.dart';
import 'package:tokenapp/ui/navigation_container/navigation_container.dart';
import 'package:tokenapp/ui/section1/service_provider_login/service_provider_login_screen.dart';
import 'package:tokenapp/ui/section1/service_provider_signup/service_provider_signup_screen.dart';
import 'package:tokenapp/ui/section1/service_provider_welcome/service_provider_welcome_controller.dart';
import 'package:tokenapp/ui/section4/widgets/create_account_button.dart';
import 'package:tokenapp/utils/colors.dart';
import 'package:tokenapp/utils/constants.dart';
import 'package:tokenapp/utils/dimens.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceProviderWelcomeScreen extends StatefulWidget {
  @override
  _ServiceProviderWelcomeScreenState createState() => _ServiceProviderWelcomeScreenState();
} 

class _ServiceProviderWelcomeScreenState extends State<ServiceProviderWelcomeScreen> {

  final _controller = ServiceProviderWelcomeController();

  @override
  void initState() {
    super.initState();
    _controller.isLoggedIn().then((value){
      if(value){
        Get.off(NavigationContainer());
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GSColors.green_primary,
        body: Stack(
          children: [
            Image.asset(
              AssetConstants.ic_welcome,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(
                  GSSizeConstants.padding30,
                  GSSizeConstants.zero,
                  GSSizeConstants.padding30,
                  GSSizeConstants.zero,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Center(
                          child: Image.asset(
                            AssetConstants.logoTransparent,
                            width: dp350,
                            height: dp350,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: GSSizeConstants.padding20),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          GSStrings.get_started + "\n",
                          textAlign: TextAlign.start,
                          //style: GSTextStyles.make18xw400Style(),
                          style: GoogleFonts.manrope(
                            color: white,
                            fontSize: dp18,
                            fontWeight: FontWeight.normal,
                            height: 0.4
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: GSSizeConstants.padding20),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Millions of\n"
                          "people use to\n"
                          "turn their ideas\n",
                          //style: GSTextStyles.make34xw700Style(),
                          style: GoogleFonts.manrope(
                            color: white,
                            fontSize: dp30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: GSSizeConstants.padding30,
                    ),
                    GSButton(
                      text: GSStrings.sign_in,
                      onClick: (){
                        Get.to(ServiceProviderLoginScreen());
                      },
                    ),
                    SizedBox(
                      height: GSSizeConstants.padding22,
                    ),
                    CreateAccountButtonOutlineStock(
                      onClick: (){
                        Get.to(ServiceProviderSignupScreen());
                      },
                    ),
                    SizedBox(
                      height: GSSizeConstants.padding55,
                    ),
                  ],
                )),
          ],
        ));
  } //: Widget
} //: State
