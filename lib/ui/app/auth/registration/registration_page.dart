import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tokenapp/app_style.dart';
import 'package:tokenapp/base/widget/custom_filled_button.dart';
import 'package:tokenapp/base/widget/custom_text_form_field.dart';
import 'package:tokenapp/constants.dart';
import 'package:tokenapp/data/models/MessageResponse.dart';
import 'package:tokenapp/data/models/container/contactus/ContactUsModel.dart';
import 'package:tokenapp/data/models/container/contactus/ContactUsResponse.dart';
import 'package:tokenapp/ui/app/auth/registration/registration_page_two.dart';
import 'package:tokenapp/ui/common_widgets/positive_button.dart';
import 'package:tokenapp/ui/container/UIConstants/Colors.dart';
import 'package:tokenapp/ui/container/UIConstants/GSWidgetStyles.dart';
import 'package:tokenapp/ui/container/UIConstants/Strings.dart';
import 'package:tokenapp/ui/container/contact_us/ContactUsController.dart';
import 'package:tokenapp/utils/constants.dart';
import 'package:tokenapp/utils/dimens.dart';
import 'package:tokenapp/utils/reges_format.dart';
import 'package:tokenapp/utils/spacers.dart';
import 'package:tokenapp/widgets/widget_button.dart';
import 'package:tokenapp/widgets/widget_textfrom_field.dart';
import 'package:tokenapp/widgets/widget_textstyle.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _LoginPageViewState createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<RegistrationPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController phonController;
  late TextEditingController nameController;


  ContactUsController controller=new ContactUsController();

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
                    title: "Step 01/03",
                    margin: EdgeInsets.symmetric(horizontal: 30.0),
                    textStyle: AppFontStyle.headerhinttitle,

                  ),
                  SizedBox(height: 10,),
                  WidgetTextField(
                    title: "Create Account",
                    margin: EdgeInsets.symmetric(horizontal: 30.0),
                    textStyle: AppFontStyle.headerTitle,

                  ),
                  SizedBox(height: 15,),
                  WidgetTextField(
                    title: "Collaboratively harness high-payoff methodologies via out-of-the-box vortals",
                    margin: EdgeInsets.symmetric(horizontal: 30.0),
                    textStyle: AppFontStyle.subHeaderTitle,

                  ),
                  SizedBox(height: 16,),
                  WidgetTextFormField(
                    formController: nameController,
                    hintText: "NAME",
                    margin:EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),
                    inputType: TextInputType.name,
                    hint: GSStrings.contact_us_full_name,
                  ),
                  WidgetTextFormField(
                    formController: emailController,
                    hintText: "EMAIL ADDRESS",
                    margin:EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),
                    inputType: TextInputType.emailAddress,
                    hint: GSStrings.contact_us_full_name,
                  ),
                  WidgetTextFormField(
                    formController: phonController,
                    hintText: "PHONE",
                    margin:EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),
                    inputType: TextInputType.phone,
                    hint: GSStrings.contact_us_full_name,
                  ),
                  WidgetTextFormField(
                    formController: passwordController,
                    hintText: "PASSWORD",
                    iconColor: Color(0xffCACACA),
                    margin:EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),
                    inputType: TextInputType.visiblePassword,

                    hint: GSStrings.contact_us_full_name,
                  ),
                  WidgetTextFormField(
                    formController: confirmPasswordController,
                    inputType: TextInputType.visiblePassword,
                    iconColor: Color(0xffCACACA),
                    margin:EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),
                    hintText: "CONFIRM PASSWORD",
                    hint: GSStrings.contact_us_full_name,
                  ),

                 WidgetButton(
                   title:"Login to Account",
                   margin:EdgeInsets.symmetric(horizontal: 30.0,vertical: 24.0),
                   onTap: () {
                     print("tapped on container");
                     Navigator.push(
                       context,
                       MaterialPageRoute(
                         builder: (context) => (RegistrationTwoPage()),
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

