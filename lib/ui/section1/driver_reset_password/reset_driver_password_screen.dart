import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tokenapp/base/widget/GSButtonWidget.dart';
import 'package:tokenapp/data/models/driver/driver_password_reset_request.dart';
import 'package:tokenapp/data/models/service_partner/vehicle/sp_reset_vehicle_login_request.dart';
import 'package:tokenapp/ui/common_widgets/common_loading_dialog.dart';
import 'package:tokenapp/ui/common_widgets/common_password_field.dart';
import 'package:tokenapp/ui/common_widgets/large_headline_widget.dart';
import 'package:tokenapp/ui/common_widgets/positive_button.dart';
import 'package:tokenapp/ui/common_widgets/text_field_headline.dart';
import 'package:tokenapp/ui/container/UIConstants/Colors.dart';
import 'package:tokenapp/ui/section1/driver_reset_password/reset_password_request_controller.dart';
import 'package:tokenapp/ui/section1/service_providerreset_vehicle_login/service_provider_reset_vehicle_login_controller.dart';
import 'package:tokenapp/util/lib/toast.dart';
import 'package:tokenapp/utils/constants.dart';
import 'package:tokenapp/utils/dimens.dart';
import 'package:tokenapp/utils/spacers.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetDriverPasswordScreen extends StatefulWidget {


  const ResetDriverPasswordScreen();

  @override
  _ResetDriverPasswordScreenState createState() =>
      _ResetDriverPasswordScreenState();
}

class _ResetDriverPasswordScreenState extends State<ResetDriverPasswordScreen> {

  var resetCodeController = TextEditingController();
  var newPasswordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  final _controller = ResetPasswordRequestController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (ctx, constraints) {
          return Container(
            padding: EdgeInsets.all(dp20),
            child: ListView(
              children: [
                LargeHeadlineWidget(
                  headline: "Reset Vehicle Login",
                ),
                VSpacer10(),
                SizedBox(
                  width: constraints.maxWidth * 0.6,
                  child: TextFieldHeadline(
                    headline: "It’s time to rock n role!"
                        " Let’s get started now.",
                  ),
                ),
                VSpacer40(),
                CommonPasswordField(
                  controller: resetCodeController,
                  hint: "One time code",
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

                    var request = DriverPasswordResetRequest(
                        resetCode: resetCodeController.text,
                        password: newPasswordController.text,
                    );

                    if(validate()){
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
    resetCodeController.text.trim().isEmpty ||
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

  resetPassword(DriverPasswordResetRequest request) async{

    showLoader();

    var response = await _controller.resetDriverLogin(request);

    Get.back();
    if(response.success){
      modalBottomSheetMenuSuccess(context);
    }
    ToastUtil.show(response.msg);

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
                            "Password reset successful! Please login again.",
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
                        text: "Reset Vehicle Login",
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
