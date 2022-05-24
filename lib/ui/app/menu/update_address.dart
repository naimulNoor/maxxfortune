import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tokenapp/app_style.dart';
import 'package:tokenapp/data/localdata.dart';
import 'package:tokenapp/data/models/container/FaqModel.dart';
import 'package:tokenapp/data/models/container/contactus/ContactUsModel.dart';
import 'package:tokenapp/data/models/contuctus/model_contuct_us.dart';
import 'package:tokenapp/ui/app/auth/forgetpassword/forgetpass_page.dart';
import 'package:tokenapp/utils/constants.dart';
import 'package:tokenapp/widgets/widget_button.dart';

import 'package:tokenapp/widgets/widget_textfrom_field_two.dart';


import '../../../constants.dart';

class UpdateAddressPage extends StatefulWidget {

  const UpdateAddressPage({Key? key}) : super(key: key);


  @override
  _FaqViewState createState() => _FaqViewState();
}

class _FaqViewState extends State<UpdateAddressPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController countryController;
  late TextEditingController codeController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    emailController.text="";

    passwordController = TextEditingController();
    passwordController.text="";

    countryController = TextEditingController();
    countryController.text="Singapore";

    codeController = TextEditingController();
    codeController.text="788122";

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
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,

        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 0,
                child: TitleWidget()),
            Expanded(
              flex: 1,
              child:  SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WidgetTextFormFieldTwo(formController: emailController, inputType: TextInputType.streetAddress, hintText: "STREET ADDRESS",hintColor: Colors.black, margin:EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),),
                      WidgetTextFormFieldTwo(formController: emailController, inputType: TextInputType.text, hintText: "APT/ SUITE (OPTIONAL)",hintColor: Colors.black, margin:EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),),
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                                flex:2,
                                child: WidgetTextFormFieldTwo(
                                    formController: countryController,
                                    inputType: TextInputType.streetAddress,
                                    hintText: "CURRENT CITY",
                                    hintColor: Colors.black,
                                    margin:EdgeInsets.fromLTRB(30, 10, 5, 0)
                                )),
                            Expanded(
                                flex:2,
                                child: WidgetTextFormFieldTwo(
                                    formController: codeController,
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
                        title:"Update New Password",
                        margin:EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),
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
            )
          ],
        ),
      ),
    );
  }

}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Container(
            height: 160.0,
            width: double.maxFinite,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("images/bg_contactus.png"),
              ),
            ),
          ),
          SafeArea(child: Container(
              height: 160,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child:Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(Icons.arrow_back,color: Colors.grey,)),
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width:300,
                            child: Text(
                              "Address",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  height: 1.5,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0,),
                          Container(
                            width: 300,
                            child: Text(
                              "Collaboratively harness high-payoff methodologies via out-of-the-box vortals",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.grey
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ))
          )
        ]);
  }
}










class FaqItemWidget extends StatefulWidget {
  CotactUsModel model;
  FaqItemWidget(this.model);

  @override
  State createState() => CustomExpansionTileState();
}

class CustomExpansionTileState extends State<FaqItemWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child:  Container(
          margin: EdgeInsets.all(5.0),
          child: ListTile(
            leading: CircleAvatar(child: Image.asset(widget.model.icon,height: 22,width: 22,),backgroundColor: Colors.white,),
            title: Text(widget.model.title),
            subtitle: Text(widget.model.subtitle),
          )
      ),
    );
  }
}


