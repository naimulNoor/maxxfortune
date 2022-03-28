import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tokenapp/base/widget/GSButtonWidget.dart';
import 'package:tokenapp/data/models/service_partner/auth/password_reset_request.dart';
import 'package:tokenapp/ui/common_widgets/common_loading_dialog.dart';
import 'package:tokenapp/ui/common_widgets/common_password_field.dart';
import 'package:tokenapp/ui/common_widgets/large_headline_widget.dart';
import 'package:tokenapp/ui/common_widgets/positive_button.dart';
import 'package:tokenapp/ui/common_widgets/text_field_headline.dart';
import 'package:tokenapp/ui/container/ForgotPassword/forgot_password_controller.dart';
import 'package:tokenapp/ui/container/UIConstants/Colors.dart';
import 'package:tokenapp/ui/section1/Service_provider_reset_password/service_provider_reset_password_controller.dart';
import 'package:tokenapp/util/lib/toast.dart';
import 'package:tokenapp/utils/constants.dart';
import 'package:tokenapp/utils/dimens.dart';
import 'package:tokenapp/utils/spacers.dart';
import 'package:google_fonts/google_fonts.dart';

class GeneralUserPasswordResetScreen extends StatefulWidget {
  const GeneralUserPasswordResetScreen();

  @override
  _GeneralUserPasswordResetScreenState createState() => _GeneralUserPasswordResetScreenState();
}

class _GeneralUserPasswordResetScreenState extends State<GeneralUserPasswordResetScreen> {

  var secretCodeController = TextEditingController();
  var newPasswordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  final _controller = ForgotPasswordController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (ctx, constraints) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: dp50, vertical: dp20),
            child: ListView(
              padding: EdgeInsets.only(top: dp40),
              children: [
                LargeHeadlineWidget(
                  headline: "Reset Password",
                ),
                // VSpacer10(),
                // SizedBox(
                //   width: constraints.maxWidth * 0.6,
                //   child: TextFieldHeadline(
                //     headline: "It’s time to rock n role!"
                //         " Let’s get started now.",
                //   ),
                // ),
                VSpacer40(),
                CommonPasswordField(
                  controller: secretCodeController,
                  hint: "Secret Code",
                ),
                VSpacer20(),
                CommonPasswordField(
                  controller: newPasswordController,
                  hint: "New password",
                ),
                VSpacer20(),
                CommonPasswordField(
                  controller: confirmPasswordController,
                  hint: "Confirm new password",
                ),
                VSpacer60(),
                PositiveButton(
                  text: "Submit",
                  onClicked: () {
                    if(validate()){
                      showLoader();
                      var request = PasswordResetRequest(
                          code: secretCodeController.text,
                          password: newPasswordController.text,
                      );
                      resetPassword(request);
                    }
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }

  bool validate(){
    if(
    secretCodeController.text.trim().isEmpty ||
        newPasswordController.text.trim().isEmpty ||
        confirmPasswordController.text.trim().isEmpty
    ) {
      ToastUtil.show("Please Fill all fields");
      return false;
    }

    if(newPasswordController.text != confirmPasswordController.text){
      ToastUtil.show("Passwords do not match");
      return false;
    }

    return true;

  }

  resetPassword(PasswordResetRequest request) async{
    var response = await _controller.resetPassword(request);
    if(response.success){
      Get.back();
      modalBottomSheetMenuSuccess(context);
    }else{
      Get.back();
      ToastUtil.show(response.msg);
    }
  }

  void modalBottomSheetMenuSuccess(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (builder) {
          return new Container(
            height: 450.0,
            color: Color(0xFF737373), //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: new Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(20.0),
                        topRight: const Radius.circular(20.0))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SvgPicture.asset(
                      AssetConstants.successfulIcon,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Successful!",
                            style: GoogleFonts.manrope(
                              color: GSColors.green_secondary,
                              fontSize: dp25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Password reset successful! Please Login again.",
                            style: GoogleFonts.manrope(
                              color: GSColors.text_secondary,
                              fontSize: dp14,
                              fontWeight: FontWeight.normal,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: GSButton(
                        text: "Login",
                        onClick: () {
                          Get.back();
                          Get.back();
                        },
                      ),
                    ),
                  ],
                )),
          );
        });
  }
  
}
