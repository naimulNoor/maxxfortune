import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tokenapp/app_style.dart';
import 'package:tokenapp/data/localdata.dart';
import 'package:tokenapp/data/models/container/FaqModel.dart';
import 'package:tokenapp/data/models/container/contactus/ContactUsModel.dart';
import 'package:tokenapp/data/models/contuctus/model_contuct_us.dart';
import 'package:tokenapp/ui/container/UIConstants/Colors.dart';
import 'package:tokenapp/ui/container/UIConstants/GSWidgetStyles.dart';
import 'package:tokenapp/ui/container/UIConstants/Strings.dart';
import 'package:tokenapp/ui/container/book_a_bus/book_a_bus.dart';
import 'package:tokenapp/ui/container/faq/FaqController.dart';
import 'package:tokenapp/ui/container/lost_and_found/lost_and_found.dart';
import 'package:tokenapp/ui/container/our_service/our_service.dart';
import 'package:tokenapp/ui/container/privacy_and_concern/privacy_and_concern.dart';
import 'package:tokenapp/ui/container/terms_and_conditions/terms_and_conditions.dart';
import 'package:tokenapp/utils/constants.dart';
import 'package:tokenapp/widgets/widget_button.dart';
import 'package:tokenapp/widgets/widget_menu_listtile.dart';
import 'package:tokenapp/widgets/widget_navigation_container.dart';
import 'package:tokenapp/widgets/widget_textfrom_field.dart';
import 'package:screenshot/screenshot.dart';

import '../../../constants.dart';

class AccountSettingsSettingsPage extends StatefulWidget {
  const AccountSettingsSettingsPage({Key? key}) : super(key: key);

  @override
  _FaqViewState createState() => _FaqViewState();
}

class _FaqViewState extends State<AccountSettingsSettingsPage> {
  late TextEditingController emailController;
  FaqController controller=new FaqController();

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
                        SizedBox(height: 24,),
                        WidgetMenuListTile(
                            title:"Information",
                            subtitle: "News & Lates Update",
                            icon: SvgPicture.asset(AssetConstants.information,height: 40,width: 40,),
                            iconColor: Color(0xff2E7BE4),
                            subTitleColor: Color(0xff787B8C),
                            titleColor: Color(0xff000000)
                        ),
                        SizedBox(height: 12,),
                        WidgetMenuListTile(
                            title:"Change Password",
                            subtitle: "News & Lates Update",
                            icon: SvgPicture.asset(AssetConstants.changepass,height: 40,width: 40,),
                            iconColor: Color(0xff2E7BE4),
                            subTitleColor: Color(0xff787B8C),
                            titleColor: Color(0xff000000)
                        ),
                        SizedBox(height: 12,),
                        WidgetMenuListTile(
                            title:"Address",
                            subtitle: "News & Lates Update",
                            icon: SvgPicture.asset(AssetConstants.address,height: 40,width: 40,),
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
  Future<FaqModel> getFaqData() async{

    var response = await controller.FaqServiceProvider();
    print("response${response.data}");
    return response;

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
            height: 96.0,
            width: double.maxFinite,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("images/bg_contactus.png"),
              ),
            ),
          ),
          SafeArea(child: Container(

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
                        child: Row(
                          children: [
                            Expanded(
                              flex: 0,
                                child: Icon(Icons.arrow_back,color: Colors.grey,)),
                            Expanded(
                              flex: 1,
                              child: Container(

                                child: Text(
                                  "Account Settings",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      height: 1.5,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
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


