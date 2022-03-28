import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tokenapp/base/widget/GSButtonWidget.dart';
import 'package:tokenapp/data/models/general_user/general_user_login_request.dart';
import 'package:tokenapp/ui/common_widgets/common_loading_dialog.dart';
import 'package:tokenapp/ui/container/ForgotPassword/ForgotPassword.dart';
import 'package:tokenapp/ui/container/UIConstants/Strings.dart';
import 'package:tokenapp/ui/container/UIConstants/UISizeConstants.dart';
import 'package:tokenapp/ui/not_logged_in_welcome/sign_in/sign_in_controller.dart';
import 'package:tokenapp/ui/section4/widgets/text_fields.dart';
import 'package:tokenapp/util/lib/toast.dart';
import 'package:tokenapp/utils/colors.dart';
import 'package:tokenapp/utils/constants.dart';
import 'package:tokenapp/utils/dimens.dart';
import 'package:tokenapp/utils/spacers.dart';
import 'package:google_fonts/google_fonts.dart';

import '../navigation_container/navigation_container.dart';

class NSignInScreen extends StatefulWidget {

  final bool isFromPayment;

  const NSignInScreen({Key? key, this.isFromPayment = false}) : super(key: key);

  @override
  _Sec4SignInScreenState createState() => _Sec4SignInScreenState();
}

class _Sec4SignInScreenState extends State<NSignInScreen> {
  bool value = false;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  final _controller = SignInController(Get.find());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: GSColors.green_primary,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
            AssetConstants.ic_welcome,
          ),
          fit: BoxFit.cover,
        )),
        child: Stack(
          children: [
            SafeArea(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 10),
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    //height: GSSizes.size278h,
                    width: double.infinity,
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2,
                        ),

                        //Get start text
                        Text(
                          GSStrings.welcome_back,
                          textAlign: TextAlign.start,
                          style: GoogleFonts.manrope(
                            color: white,
                            fontSize: dp30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(
                          height: GSSizeConstants.padding10,
                        ),

                        // Description test
                        Container(
                            width: 256,
                            child: Center(
                                child: Text(
                              "It’s time to rock n role! Let’s\nget started now.",
                              style: GoogleFonts.manrope(
                                color: white,
                                fontSize: dp18,
                                fontWeight: FontWeight.normal,
                              ),
                              textAlign: TextAlign.center,
                            ))),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: GSSizeConstants.padding55,
                  ),
                  Sec4TextField(
                    controller: emailController,
                    hints: GSStrings.email_field_hints,
                  ),
                  SizedBox(
                    height: GSSizeConstants.padding17,
                  ),
                  Sec4PasswordTextField(
                    controller: passwordController,
                  ),
                  // Container(
                  //   padding: EdgeInsets.symmetric(vertical: 30, horizontal: 5),
                  //   child: Row(
                  //     children: [
                  //       CustomCheckBox(
                  //         value: value,
                  //         shouldShowBorder: true,
                  //         borderColor: Colors.white,
                  //         uncheckedFillColor: Colors.white60,
                  //         checkedFillColor: GSColors.green_normal,
                  //         borderRadius: 2,
                  //         borderWidth: 1,
                  //         checkBoxSize: 15,
                  //         uncheckedIconColor: Colors.transparent,
                  //         onChanged: (val) {
                  //           //do your stuff here
                  //           setState(() {
                  //             value = val;
                  //           });
                  //         },
                  //       ),
                  //       Text(
                  //         "Keep me signed in",
                  //         style: GoogleFonts.manrope(
                  //           color: white,
                  //           fontSize: dp18,
                  //           fontWeight: FontWeight.normal,
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  VSpacer20(),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: GSButton(
                      text: GSStrings.sign_in,
                      onClick: () {
                        showLoader();
                        if (validate()) {
                          var request = GeneralUserLoginRequest(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                          loginUser(request);
                        } else {
                          Get.back();
                          ToastUtil.show("Please fill all fields");
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: GSSizeConstants.padding7,
                  ),
                  SizedBox(
                    height: GSSizeConstants.padding7,
                  ),
                  Sec4TextButton(
                    text1: "Forgot Password?",
                    text2: "Reset here",
                    onClicked: () {
                      Get.to(ForgotPassword());
                    },
                  ),
                  SizedBox(
                    height: GSSizeConstants.padding25,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  loginUser(GeneralUserLoginRequest request) async{

    var response = null;

    ToastUtil.show(response.msg);
    Get.back();
    if(response.data != null){
      await _controller.storeToken(response.data!.token);
      await _controller.storeUser(response.data!.user);

      if(widget.isFromPayment){
        Get.back();
        Get.back();
        Get.back();
      }else{
        Get.back();
        Get.off(NavigationContainer());
      }
    }

  }

  bool validate(){
    return emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
  }

}
