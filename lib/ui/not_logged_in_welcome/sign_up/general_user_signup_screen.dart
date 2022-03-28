import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tokenapp/base/widget/GSButtonWidget.dart';
import 'package:tokenapp/base/widget/GSTextField.dart';
import 'package:tokenapp/data/models/general_user/general_user_signup_request.dart';
import 'package:tokenapp/ui/common_widgets/common_loading_dialog.dart';
import 'package:tokenapp/ui/container/UIConstants/Colors.dart';
import 'package:tokenapp/ui/container/UIConstants/GSWidgetStyles.dart';
import 'package:tokenapp/ui/container/UIConstants/Strings.dart';
import 'package:tokenapp/ui/container/UIConstants/UISizeConstants.dart';
import 'package:tokenapp/ui/not_logged_in_welcome/sign_in/sign_in_screen.dart';
import 'package:tokenapp/ui/section4/widgets/text_fields.dart';
import 'package:tokenapp/util/lib/toast.dart';
import 'package:tokenapp/utils/colors.dart';
import 'package:tokenapp/utils/constants.dart';
import 'package:tokenapp/utils/dimens.dart';
import 'package:tokenapp/utils/spacers.dart';
import 'package:google_fonts/google_fonts.dart';

import 'general_user_signup_controller.dart';

class GeneralUserSignupScreen extends StatefulWidget {
  @override
  _GeneralUserSignupScreenState createState() =>
      _GeneralUserSignupScreenState();
}

// State
class _GeneralUserSignupScreenState extends State<GeneralUserSignupScreen> {
  bool isChecked = false;
  var mainWidth;
  var maxLines = 3;

  final _controller = GeneralUserSignupController();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: GSColors.green_primary,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: GSSizes.size126h,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AssetConstants.signup_bg_image),
                      fit: BoxFit.cover)),
              child: Center(
                child: Text(
                  GSStrings.create_new_account,
                  textAlign: TextAlign.start,
                  style: GSTextStyles.make28xw600Style(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: GSSizeConstants.padding105),
              child: Container(
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      GSTextField(
                        controller: nameController,
                        hints: GSStrings.full_name,
                      ),
                      SizedBox(
                        height: GSSizeConstants.padding12,
                      ),
                      GSTextField(
                        type: TextInputType.phone,
                        controller: phoneNumberController,
                        hints: GSStrings.phone_number,
                      ),
                      SizedBox(
                        height: GSSizeConstants.padding12,
                      ),
                      GSTextField(
                        type: TextInputType.emailAddress,
                        controller: emailController,
                        hints: GSStrings.email_address,
                      ),
                      SizedBox(
                        height: GSSizeConstants.padding12,
                      ),
                      GSTextField(
                        controller: addressController,
                        hints: GSStrings.address,
                      ),
                      SizedBox(
                        height: GSSizeConstants.padding12,
                      ),
                      SizedBox(
                        width: GSSizes.size316x56.width,
                        height: GSSizes.size316x56.height,
                        child: Sec2PasswordTextField(
                          controller: passwordController,
                        ),
                      ),
                      SizedBox(
                        height: GSSizeConstants.padding12,
                      ),
                      SizedBox(
                        width: GSSizes.size316x56.width,
                        height: GSSizes.size316x56.height,
                        child: Sec2PasswordTextField(
                          controller: confirmPasswordController,
                          hint: GSStrings.reType_password,
                        ),
                      ),
                      VSpacer20(),
                      SizedBox(
                        width: GSSizes.size316x56.width,
                        height: GSSizes.size316x56.height,
                        child: _agreeToTerms(),
                      ),
                      VSpacer20(),
                      GSButton(
                        onClick: (){
                          showLoader();
                          if (validatePassword()) {
                            if(validate()){
                              if(!isChecked) {
                                Get.back();
                                ToastUtil.show("Please agree to our terms and conditions");
                              } else{
                                var request = GeneralUserSignupRequest(
                                  name: nameController.text,
                                  email: emailController.text,
                                  phone: phoneNumberController.text,
                                  password: passwordController.text,
                                  address: addressController.text,
                                );
                                signup(request);
                              }
                            }else{
                              Get.back();
                              ToastUtil.show("Please fill all fields");
                            }
                          } else {
                            Get.back();
                            ToastUtil.show("Passwords do not match");
                          }
                        },
                        text: GSStrings.sign_up,
                      ),
                      SizedBox(
                        height: GSSizeConstants.padding7,
                      ),
                      GSTextButton(
                        onClick: () {
                          Get.back();
                          Get.to(NSignInScreen());
                        },
                        text: GSStrings.already_have_an_account_sIgn_in,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool validatePassword() {
    return passwordController.text == confirmPasswordController.text;
  }

  bool validate(){

    return nameController.text.trim().isNotEmpty
        && emailController.text.trim().isNotEmpty
        && phoneNumberController.text.trim().isNotEmpty
        && addressController.text.trim().isNotEmpty
        && passwordController.text.trim().isNotEmpty;
  }

  validateCheck(){

  }

  void signup(GeneralUserSignupRequest request) async {
    var response = await _controller.signupGeneralUser(request);
    if (response.data!=null) {
      Get.back();
      modalBottomSheetMenuSuccess(context);
    } else {
      Get.back();
    }
    ToastUtil.show(response.msg);
  }

  void modalBottomSheetMenuSuccess(BuildContext context) {
    showModalBottomSheet(
        isDismissible: false,
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
                            "Your account has been successfully created. Please login!",
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
                          Get.to(NSignInScreen());
                        },
                      ),
                    ),
                  ],
                )),
          );
        });
  }

  _agreeToTerms() => Row(
    children: [
      Checkbox(
          fillColor: MaterialStateProperty.all(accent),
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          }),
      Text(
        'I agree to terms & conditions',
        style: TextStyle(fontSize: dp15, color: grey),
      ),
    ],
  );
}
