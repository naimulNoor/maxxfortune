import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tokenapp/app_style.dart';
import 'package:tokenapp/ui/app/auth/registration/registration_page.dart';
import 'package:tokenapp/ui/container/UIConstants/Strings.dart';
import 'package:tokenapp/widgets/widget_button.dart';
import 'package:tokenapp/widgets/widget_textfrom_field.dart';
import 'package:tokenapp/widgets/widget_textstyle.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageViewState createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;


  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    emailController.text="";
    passwordController = TextEditingController();
    passwordController.text="";

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
                  title: "WelcomeBack",
                  margin: EdgeInsets.symmetric(horizontal: 30.0),
                  textStyle: AppFontStyle.headerTitle,

                ),
                SizedBox(height: 15,),
                WidgetTextField(
                  title: "Collaboratively harness high-payoff methodologies via out-of-the-box vortals",
                  margin: EdgeInsets.symmetric(horizontal: 30.0),
                  textStyle: AppFontStyle.subHeaderTitle,

                ),
                SizedBox(height: 27,),
                WidgetTextFormField(
                  formController: emailController,
                  hintText: "Email Address",
                  margin:EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),
                  inputType: TextInputType.name,
                  hint: GSStrings.contact_us_full_name,
                ),
                WidgetTextFormField(
                  formController: passwordController,
                  inputType: TextInputType.name,
                  margin:EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),
                  hintText: "********",

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
                       builder: (context) => (RegistrationPage()),
                     ),
                   );
                 },
               ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

