import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tokenapp/base/widget/GSButtonWidget.dart';
import 'package:tokenapp/base/widget/GSTextField.dart';
import 'package:tokenapp/ui/container/UIConstants/GSWidgetStyles.dart';
import 'package:tokenapp/ui/container/UIConstants/Strings.dart';
import 'package:tokenapp/ui/container/UIConstants/UISizeConstants.dart';
import 'package:tokenapp/ui/not_logged_in_welcome/sign_in/sign_in_screen.dart';
import 'package:tokenapp/ui/section4/widgets/text_fields.dart';
import 'package:tokenapp/utils/colors.dart';
import 'package:tokenapp/utils/constants.dart';
import 'package:tokenapp/utils/dimens.dart';
import 'package:tokenapp/utils/spacers.dart';

// UI
class CreateNewAccount extends StatefulWidget {
  @override
  _CreateNewAccountState createState() => _CreateNewAccountState();
}

// State
class _CreateNewAccountState extends State<CreateNewAccount> {

  bool isChecked = false;

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
                        controller: TextEditingController(),
                        hints: GSStrings.full_name,
                      ),
                      SizedBox(
                        height: GSSizeConstants.padding12,
                      ),
                      GSTextField(
                        controller: TextEditingController(),
                        hints: GSStrings.phone_number,
                      ),
                      SizedBox(
                        height: GSSizeConstants.padding12,
                      ),
                      GSTextField(
                        controller: TextEditingController(),
                        hints: GSStrings.email_address,
                      ),
                      SizedBox(
                        height: GSSizeConstants.padding12,
                      ),
                      GSTextField(
                        controller: TextEditingController(),
                        hints: GSStrings.address,
                      ),
                      SizedBox(
                        height: GSSizeConstants.padding12,
                      ),
                      SizedBox(
                        width: GSSizes.size316x56.width,
                        height: GSSizes.size316x56.height,
                        child: Sec2PasswordTextField(
                          controller: TextEditingController(),
                        ),
                      ),
                      SizedBox(
                        height: GSSizeConstants.padding12,
                      ),
                      SizedBox(
                        width: GSSizes.size316x56.width,
                        height: GSSizes.size316x56.height,
                        child: Sec2PasswordTextField(
                          controller: TextEditingController(),
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
                        text: GSStrings.sign_up,
                      ),
                      SizedBox(
                        height: GSSizeConstants.padding7,
                      ),
                      GSTextButton(
                        onClick: (){
                          Get.back();
                          Get.to(
                            NSignInScreen(),
                          );
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
