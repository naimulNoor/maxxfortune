import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tokenapp/ui/app/auth/registration/registration_page_three.dart';
import 'package:tokenapp/ui/ninja/CreateAccountScreenThree.dart';
import 'package:tokenapp/utils/AppCustomColors.dart';

import 'package:tokenapp/widgets/widget_inputotp_field.dart';

class RegistrationTwoPage extends StatefulWidget {
  const RegistrationTwoPage({Key? key}) : super(key: key);

  @override
  _LoginPageViewState createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<RegistrationTwoPage> {

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
      child: SafeArea(
        child: Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  AppCustomColors.createAccPageStartColor,
                  AppCustomColors.createAccPageEndColor,
                ],begin: Alignment.topLeft, end: Alignment.bottomRight)),
            child: SingleChildScrollView(
              child: _appBody(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _appBody(){
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(child: Icon(Icons.arrow_back_outlined, color: Colors.black,size: 22,), onTap: () {Navigator.pop(context);},),
          const SizedBox(height: 20.0,),
          RichText(text: const TextSpan(
              children: [
                TextSpan(text: "STEP ", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0, color: Colors.black38)),
                TextSpan(text: "02", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15.0, color: AppCustomColors.textLightColor)),
                TextSpan(text: "/03", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0, color: Colors.black38)),
              ]
          )),
          const SizedBox(height: 15.0,),
          const Text("Check Your Email/Phone", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25.0, color: AppCustomColors.textDarkColor),),
          const SizedBox(height: 15.0,),
          const Text("Collaboratively harness high-payoff methodologies via out-of-the-box vortals", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0, color: Colors.black38),),
          const SizedBox(height: 50.0,),
          WidgetInputOtpField(
            margin:EdgeInsets.symmetric(horizontal: 10.0),
          ),
          const SizedBox(height: 40.0,),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 48.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                gradient: const LinearGradient(
                  begin: Alignment(-1.0, -2.0),
                  end: Alignment(1.0, 2.0),
                  colors: <Color>[
                    AppCustomColors.buttonStartColor,
                    AppCustomColors.buttonEndColor
                  ],
                ),
              ),
              child: InkWell(
                child: Center(child: Text("Next", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0, color: Colors.white), textAlign: TextAlign.center,)),
                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => (CreateAccountThreeScreenPage())));},
              ),
            ),
          ),
          const SizedBox(height: 20.0,),
          Center(child: Text("Resend Code", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0, color: AppCustomColors.textDarkColor),textAlign: TextAlign.center,)),
        ],
      ),
    );
  }

}

