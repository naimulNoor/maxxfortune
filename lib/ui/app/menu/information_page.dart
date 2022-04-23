import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tokenapp/app_style.dart';
import 'package:tokenapp/data/localdata.dart';
import 'package:tokenapp/data/models/container/FaqModel.dart';
import 'package:tokenapp/data/models/container/contactus/ContactUsModel.dart';
import 'package:tokenapp/data/models/contuctus/model_contuct_us.dart';


import 'package:tokenapp/utils/constants.dart';
import 'package:tokenapp/widgets/widget_button.dart';
import 'package:tokenapp/widgets/widget_menu_listtile.dart';
import 'package:tokenapp/widgets/widget_navigation_container.dart';
import 'package:tokenapp/widgets/widget_textfrom_field.dart';
import 'package:screenshot/screenshot.dart';

import '../../../constants.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  _FaqViewState createState() => _FaqViewState();
}

class _FaqViewState extends State<InformationPage> {
  late TextEditingController emailController;

  @override
  void initState() {
    // TODO: implement initState

    emailController = TextEditingController();
    emailController.text="";
    super.initState();
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
        bottomNavigationBar: WidgetNavigation("menu",3),
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
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("GENERAL",style:TextStyle(
                            color: Color(0xff707A89),
                            fontWeight: FontWeight.w600,
                            fontSize: 15.0
                        ),),
                        SizedBox(height: 12,),
                        WidgetMenuListTile(
                            onTap: (){},
                            title:"News & Blog",
                            subtitle: "News & Lates Update",
                            icon: SvgPicture.asset(AssetConstants.news,height: 40,width: 40,),
                            iconColor: Color(0xff2E7BE4),
                            subTitleColor: Color(0xff787B8C),
                            titleColor: Color(0xff000000)
                        ),
                        WidgetMenuListTile(
                            onTap: (){},
                            title:"Refer and Earn",
                            subtitle: "News & Lates Update",
                            icon: SvgPicture.asset(AssetConstants.refer,height: 40,width: 40,),
                            iconColor: Color(0xff2E7BE4),
                            subTitleColor: Color(0xff787B8C),
                            titleColor: Color(0xff000000)
                        ),
                        SizedBox(height: 24,),
                        Text("COMPANY",style:TextStyle(
                            color: Color(0xff707A89),
                            fontWeight: FontWeight.w600,
                            fontSize: 15.0
                        ),),
                        SizedBox(height: 12,),
                        WidgetMenuListTile(
                            onTap: (){},
                            title:"FAQs",
                            subtitle: "News & Lates Update",
                            icon: SvgPicture.asset(AssetConstants.faq,height: 40,width: 40,),
                            iconColor: Color(0xff2E7BE4),
                            subTitleColor: Color(0xff787B8C),
                            titleColor: Color(0xff000000)
                        ),
                        WidgetMenuListTile(
                            onTap: (){},
                            title:"Contact with US",
                            subtitle: "News & Lates Update",
                            icon: SvgPicture.asset(AssetConstants.contact,height: 40,width: 40,),
                            iconColor: Color(0xff2E7BE4),
                            subTitleColor: Color(0xff787B8C),
                            titleColor: Color(0xff000000)
                        ),
                        WidgetMenuListTile(
                            onTap: (){},
                            title:"Privacy Policy",
                            subtitle: "News & Lates Update",
                            icon: SvgPicture.asset(AssetConstants.privacyIcon,height: 40,width: 40,),
                            iconColor: Color(0xff2E7BE4),
                            subTitleColor: Color(0xff787B8C),
                            titleColor: Color(0xff000000)
                        ),
                        SizedBox(height: 24,),
                        Text("ACCOUNT",style:TextStyle(
                            color: Color(0xff707A89),
                            fontWeight: FontWeight.w600,
                            fontSize: 15.0
                        ),),
                        SizedBox(height: 12,),
                        WidgetMenuListTile(
                            onTap: (){},
                            title:"Account Settings",
                            subtitle: "Generate Lorem Ipsum place.",
                            icon: SvgPicture.asset(AssetConstants.privacyIcon,height: 40,width: 40,),
                            iconColor: Color(0xff2E7BE4),
                            subTitleColor: Color(0xff787B8C),
                            titleColor: Color(0xff000000)
                        ),
                        WidgetMenuListTile(
                            onTap: (){},
                            title:"Logout",
                            subtitle: "Generate Lorem Ipsum place.",
                            icon: SvgPicture.asset(AssetConstants.lock,height: 40,width: 40,),
                            iconColor: Color(0xff2E7BE4),
                            subTitleColor: Color(0xff787B8C),
                            titleColor: Color(0xff000000)
                        ),
                      ],
                    )
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
              height: 300,
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
                              "Naimul Hassan Noor",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  height: 1.5,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          SizedBox(height: 2.0,),
                          Container(
                            width: 300,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "You Have:",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 17.0,
                                      color: Colors.grey
                                  ),
                                ),
                                SizedBox(width: 5,),
                                Row(children: [
                                  Image.asset("images/icons/lion.png",height: 30,width: 30,),
                                  SizedBox(width: 5,),
                                  Text(
                                    "200",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black
                                    ),
                                  ),
                                ],),
                                SizedBox(width: 5,),
                                Text(
                                  "Coins",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 17.0,
                                      color: Colors.grey
                                  ),
                                ),
                              ],
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


