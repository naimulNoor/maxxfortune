import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tokenapp/base/widget/GSButtonWidget.dart';
import 'package:tokenapp/ui/container/CreateNewAccount/CreateNewAccount.dart';
import 'package:tokenapp/ui/container/UIConstants/Colors.dart';
import 'package:tokenapp/ui/container/UIConstants/Strings.dart';
import 'package:tokenapp/ui/container/UIConstants/UISizeConstants.dart';
import 'package:tokenapp/ui/not_logged_in_welcome/navigation_container/navigation_container.dart';
import 'package:tokenapp/ui/not_logged_in_welcome/sign_up/general_user_signup_screen.dart';
import 'package:tokenapp/ui/not_logged_in_welcome/welcome/general_user_welcome_controller.dart';
import 'package:tokenapp/ui/section4/widgets/create_account_button.dart';
import 'package:tokenapp/utils/colors.dart';
import 'package:tokenapp/utils/constants.dart';
import 'package:tokenapp/utils/dimens.dart';
import 'package:google_fonts/google_fonts.dart';

import '../sign_in/sign_in_screen.dart';


class NotLoggedInWelcome extends StatefulWidget {

  final bool isFromPayment;
  final bool goToBookingScreen;

  const NotLoggedInWelcome({Key? key, this.isFromPayment = false, this.goToBookingScreen = false}) : super(key: key);

  @override
  _NotLoggedInWelcomeState createState() => _NotLoggedInWelcomeState();
}

class _NotLoggedInWelcomeState extends State<NotLoggedInWelcome> {

  final _controller = GeneralUserWelcomeController();

  @override
  void initState() {
    _controller.isLoggedIn().then((value){
      if(value){
        Get.off(NavigationContainer());
      }
    });
    super.initState();
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
            SafeArea(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        GSSizeConstants.padding30,
                        GSSizeConstants.zero,
                        GSSizeConstants.padding30,
                        GSSizeConstants.zero),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      //mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        //Get start text
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: GSSizeConstants.padding20),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              GSStrings.get_started + "\n",
                              textAlign: TextAlign.start,
                              //style: GSTextStyles.make18xw400Style(),
                              style: GoogleFonts.manrope(
                                color: white,
                                fontSize: dp18,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),

                        // Description text
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
                            Get.to(NSignInScreen(isFromPayment: widget.isFromPayment,));
                          },
                        ),
                        SizedBox(
                          height: GSSizeConstants.padding22,
                        ),
                        CreateAccountButtonOutlineStock(
                          onClick: (){
                            Get.to(GeneralUserSignupScreen());
                          },
                        ),
                        SizedBox(
                          height: GSSizeConstants.padding55,
                        ),
                      ],
                    ))),
          ],
        ));
  } //: Widget
} //: State
