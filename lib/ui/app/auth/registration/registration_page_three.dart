import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:tokenapp/app_style.dart';

import 'package:tokenapp/ui/app/auth/forgetpassword/forgetpass_page.dart';

import 'package:tokenapp/widgets/widget_button.dart';

import 'package:tokenapp/widgets/widget_textfrom_field_two.dart';
import 'package:tokenapp/widgets/widget_textstyle.dart';
import 'package:tokenapp/widgets/widget_upload_multiphoto.dart';


class RegistrationThreePage extends StatefulWidget {
  const RegistrationThreePage({Key? key}) : super(key: key);

  @override
  _LoginPageViewState createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<RegistrationThreePage> {
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
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
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
                    title: "Step 03/03",
                    margin: EdgeInsets.symmetric(horizontal: 30.0),
                    textStyle: AppFontStyle.headerhinttitle,

                  ),
                  SizedBox(height: 10,),
                  WidgetUploadMultiPhotos(),
                  SizedBox(height: 16,),
                  WidgetTextFormFieldTwo(formController: emailController, inputType: TextInputType.streetAddress, hintText: "STREET ADDRESS",hintColor: Colors.black, margin:EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),),
                  WidgetTextFormFieldTwo(formController: emailController, inputType: TextInputType.text, hintText: "APT/ SUITE (OPTIONAL)",hintColor: Colors.black, margin:EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),),
                  Container(
                      child: Row(
                        children: [
                          Expanded(
                          flex:2,
                              child: WidgetTextFormFieldTwo(
                                formController: emailController,
                                inputType: TextInputType.streetAddress,
                                hintText: "CURRENT CITY",
                                hintColor: Colors.black,
                                  margin:EdgeInsets.fromLTRB(30, 10, 5, 0)
                              )),
                          Expanded(
                              flex:2,
                              child: WidgetTextFormFieldTwo(
                                formController: emailController,
                                inputType: TextInputType.streetAddress,
                                hintText: "ZIP CODE",
                                hintColor: Colors.black,
                                margin:EdgeInsets.fromLTRB(5, 10, 30, 0)
                              )),
                        ],
                      ),
                  ),
                  SizedBox(height: 10,),
                  WidgetButton(
                   title:"Next",
                   margin:EdgeInsets.symmetric(horizontal: 30.0,vertical: 24.0),
                   onTap: () {
                     Navigator.push(
                       context,
                       MaterialPageRoute(
                         builder: (context) => (ForgetPassPage()),
                       ),
                     );
                   },
                 ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

