import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tokenapp/app_style.dart';
import 'package:tokenapp/data/localdata.dart';
import 'package:tokenapp/data/models/container/FaqModel.dart';
import 'package:tokenapp/data/models/container/contactus/ContactUsModel.dart';
import 'package:tokenapp/data/models/contuctus/model_contuct_us.dart';
import 'package:tokenapp/ui/app/info/faq/faq_page.dart';
import 'package:tokenapp/ui/app/info/profile.dart';
import 'package:tokenapp/ui/app/info/refer/refer_page.dart';
import 'package:tokenapp/ui/app/info/t&c/tc_page.dart';
import 'package:tokenapp/ui/app/news/news_list.dart';

import 'package:tokenapp/utils/constants.dart';
import 'package:tokenapp/widgets/widget_button.dart';
import 'package:tokenapp/widgets/widget_menu_listtile.dart';
import 'package:tokenapp/widgets/widget_navigation_container.dart';

import '../../../constants.dart';
import '../info/contact/contact_page.dart';
import 'account_settings.dart';

class WidgetMenu extends StatefulWidget {
  const WidgetMenu({Key? key}) : super(key: key);

  @override
  _FaqViewState createState() => _FaqViewState();
}

class _FaqViewState extends State<WidgetMenu> {
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
                           onTap:(){
                             Navigator.push(
                               context,
                               MaterialPageRoute(
                                 builder: (context) => (NewsListPage()),
                               ),
                             );
                           },
                           title:"News & Blog",
                           subtitle: "News & Lates Update",
                           icon: SvgPicture.asset(AssetConstants.news,height: 40,width: 40,),
                           iconColor: Color(0xff2E7BE4),
                           subTitleColor: Color(0xff787B8C),
                           titleColor: Color(0xff000000)
                         ),
                         WidgetMenuListTile(
                             onTap: (){
                               Navigator.push(
                                 context,
                                 MaterialPageRoute(
                                   builder: (context) => (ReferPage()),
                                 ),
                               );
                             },
                            title:"Refer and Earn",
                            subtitle: "Control Your Videos",
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
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => (FaqPage( )),
                                ),
                              );
                            },
                            title:"FAQs",
                            subtitle: "News & Lates Update",
                            icon: SvgPicture.asset(AssetConstants.faq,height: 40,width: 40,),
                            iconColor: Color(0xff2E7BE4),
                            subTitleColor: Color(0xff787B8C),
                            titleColor: Color(0xff000000)
                        ),
                        WidgetMenuListTile(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => (ContactPage()),
                                ),
                              );
                            },
                            title:"Contact with US",
                            subtitle: "News & Lates Update",
                            icon: SvgPicture.asset(AssetConstants.contact,height: 40,width: 40,),
                            iconColor: Color(0xff2E7BE4),
                            subTitleColor: Color(0xff787B8C),
                            titleColor: Color(0xff000000)
                        ),
                        WidgetMenuListTile(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => (TCPage()),
                                ),
                              );
                            },
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
                            onTap:(){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => (AccountSettingsSettingsPage()),
                                ),
                              );
                            },
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
            height: 144.0,
            width: double.maxFinite,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("images/bg_contactus.png"),
              ),
            ),
          ),
          SafeArea(child: Container(
              height: 144,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20,),
                  Container(
                        child: Row(
                          children: [
                            CircleAvatar(radius: 30,backgroundImage: AssetImage("images/avater_one.png"),),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Naimul Hassan Noor",style:AppFontStyle.style_otp_field ,),
                                SizedBox(height: 5,),
                                Container(
                                  width: 109,
                                  child: InkWell(
                                    onTap:(){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => (ProfilePage ()),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: 23,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [color_lightorange,color_red],
                                            begin: const FractionalOffset(0.0, 0.0),
                                            end: const FractionalOffset(0.8, 0.0),
                                            stops: [0.0, 5.0],
                                            tileMode: TileMode.clamp
                                        ),
                                        borderRadius: BorderRadius.circular(50.0),

                                      ),
                                      child: Center(
                                          child: Text("VIEW PROFILE",style: TextStyle(color: Colors.white,fontSize: 12.0),)),
                                    ),
                                  ),
                  ),
                              ],
                            )
                          ],
                        )
                    ),
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


