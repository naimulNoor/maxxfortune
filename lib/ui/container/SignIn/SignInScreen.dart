import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tokenapp/base/widget/GSButtonWidget.dart';
import 'package:tokenapp/base/widget/GSTextField.dart';
import 'package:tokenapp/ui/container/UIConstants/Colors.dart';
import 'package:tokenapp/ui/container/UIConstants/GSWidgetStyles.dart';
import 'package:tokenapp/ui/container/UIConstants/Strings.dart';
import 'package:tokenapp/ui/container/UIConstants/UISizeConstants.dart';
import 'package:tokenapp/ui/container/widget_container/widget_container.dart';
import 'package:tokenapp/ui/navigation_container/navigation_container.dart';

// UI
class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
} //: UI

// State
class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: GSColors.green_primary,
        body: SafeArea(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: GSSizes.size278h,
          width: double.infinity,
          color: GSColors.green_primary,
          child: Column(
            children: [
              SizedBox(
                height: GSSizeConstants.padding120,
              ),

              //Get start text
              Text(
                GSStrings.welcome_back,
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
                    GSStrings.sign_in_description,
                    style: GSTextStyles.make18xw400Style(),
                    textAlign: TextAlign.center,
                  ))),
            ],
          ),
        ),
        SizedBox(
          height: GSSizeConstants.padding55,
        ),
        GSTextField(
          controller: TextEditingController(),
          hints: GSStrings.email_field_hints,
        ),
        SizedBox(
          height: GSSizeConstants.padding17,
        ),
        GSPasswordTextField(
          controller: TextEditingController(),
        ),
        SizedBox(
          height: GSSizeConstants.padding87,
        ),
        GSButton(
          text: GSStrings.sign_in,
          onClick: (){
            Get.to(WidgetContainerView());
          },
        ),
        SizedBox(
          height: GSSizeConstants.padding7,
        ),
        GSButton(
          text: "Sign in as a merchant",
          onClick: (){
            Get.to(NavigationContainer());
          },
        ),
        SizedBox(
          height: GSSizeConstants.padding7,
        ),
        GSTextButton(
          text: GSStrings.forget_password_reset_here,
        ),
      ],
    )));
  } //: Widget
} //: State
