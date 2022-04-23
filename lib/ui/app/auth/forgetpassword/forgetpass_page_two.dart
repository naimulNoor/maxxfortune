import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:tokenapp/app_style.dart';

import 'package:tokenapp/ui/app/auth/forgetpassword/forgetpass_page_three.dart';


import 'package:tokenapp/widgets/widget_button.dart';
import 'package:tokenapp/widgets/widget_inputotp_field.dart';

import 'package:tokenapp/widgets/widget_textstyle.dart';


class ForgetPassTwoPage extends StatefulWidget {
  const ForgetPassTwoPage({Key? key}) : super(key: key);

  @override
  _LoginPageViewState createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<ForgetPassTwoPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController phonController;
  late TextEditingController nameController;




  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    emailController.text="";

    passwordController = TextEditingController();
    passwordController.text="";

    confirmPasswordController = TextEditingController();
    confirmPasswordController.text="";

    phonController = TextEditingController();
    phonController.text="";

    nameController = TextEditingController();
    nameController.text="";







  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBar(
                  leading: Icon(Icons.arrow_back,color: Colors.grey,),
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                ),
                WidgetTextField(
                  title: "Forget Password",
                  margin: EdgeInsets.symmetric(horizontal: 30.0),
                  textStyle: AppFontStyle.headerTitle,

                ),
                SizedBox(height: 15,),
                WidgetTextField(
                  title: "Collaboratively harness high-payoff methodologies via out-of-the-box vortals",
                  margin: EdgeInsets.symmetric(horizontal: 30.0),
                  textStyle: AppFontStyle.subHeaderTitle,

                ),
                SizedBox(height: 48,),
                WidgetInputOtpField(
                  margin:EdgeInsets.symmetric(horizontal: 30.0),
                ),
                Column(
                  children: [
                    WidgetButton(
                      title:"Next",
                      margin:EdgeInsets.symmetric(horizontal: 30.0,vertical: 20.0),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => (ForgetPassThreePage()),
                          ),
                        );
                      },
                    ),
                    Text(
                      "Resend Code",
                      style: AppFontStyle.buttontext,
                    )
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

