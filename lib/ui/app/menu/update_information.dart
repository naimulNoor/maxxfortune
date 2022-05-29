import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tokenapp/app_style.dart';
import 'package:tokenapp/data/localdata.dart';
import 'package:tokenapp/data/models/container/FaqModel.dart';
import 'package:tokenapp/data/models/container/contactus/ContactUsModel.dart';
import 'package:tokenapp/data/models/contuctus/model_contuct_us.dart';
import 'package:tokenapp/ui/app/auth/forgetpassword/forgetpass_page.dart';
import 'package:tokenapp/ui/container/UIConstants/Colors.dart';
import 'package:tokenapp/ui/container/UIConstants/GSWidgetStyles.dart';
import 'package:tokenapp/ui/container/UIConstants/Strings.dart';
import 'package:tokenapp/utils/constants.dart';
import 'package:tokenapp/widgets/widget_button.dart';
import 'package:tokenapp/widgets/widget_menu_listtile.dart';
import 'package:tokenapp/widgets/widget_navigation_container.dart';
import 'package:tokenapp/widgets/widget_textfrom_field.dart';
import 'package:screenshot/screenshot.dart';
import 'package:tokenapp/widgets/widget_upload_multiphoto.dart';

import '../../../Utils/AppCustomColors.dart';
import '../../../constants.dart';

class UpdateInformationPage extends StatefulWidget {

  const UpdateInformationPage({Key? key}) : super(key: key);


  @override
  _FaqViewState createState() => _FaqViewState();
}

class _FaqViewState extends State<UpdateInformationPage> {
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
                      WidgetUploadMultiPhotos(),
                      SizedBox(height: 30.0,),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0,right: 30.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Name",
                            hintStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: 15.0,color: Colors.black38),
                            fillColor: Colors.white,
                            filled: true,
                            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0), borderSide: const BorderSide(color: AppCustomColors.inputBorderColor)),
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0), borderSide: const BorderSide(color: AppCustomColors.inputBorderColor)),
                          ),
                          style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12.0),
                        ),
                      ),
                      SizedBox(height: 15.0,),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: 15.0,color: Colors.black38),
                            fillColor: Colors.white,
                            filled: true,
                            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0), borderSide: const BorderSide(color: AppCustomColors.inputBorderColor)),
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0), borderSide: const BorderSide(color: AppCustomColors.inputBorderColor)),
                          ),
                          style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12.0),
                        ),
                      ),
                      SizedBox(height: 15.0,),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0, right: 30.0,),
                        child: Container(
                          height: 56,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              border: Border.all(width: 1.0, color: AppCustomColors.inputBorderColor),
                              color: Colors.white
                          ),
                          child: Row(
                            children: [
                              CountryCodePicker(
                                enabled: false,
                                initialSelection: 'SG',
                                textStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: 15.0,color: Colors.black),
                                showCountryOnly: false,
                                showOnlyCountryWhenClosed: false,
                                flagDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(50.0))
                                ),
                              ),
                              const VerticalDivider(color: AppCustomColors.inputBorderColor,),
                              const Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Phone",
                                    hintStyle: TextStyle(letterSpacing: 1, fontSize: 12.0, fontWeight: FontWeight.w500, color: Colors.black38),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0,),
                      WidgetButton(
                        title:"Update Information",
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

class TitleWidget extends StatelessWidget  {
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
                              "Information",
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


