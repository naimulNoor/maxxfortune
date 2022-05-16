import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tokenapp/app_style.dart';
import 'package:tokenapp/data/localdata.dart';
import 'package:tokenapp/data/models/container/FaqModel.dart';
import 'package:tokenapp/data/models/container/contactus/ContactUsModel.dart';
import 'package:tokenapp/data/models/contuctus/model_contuct_us.dart';
import 'package:tokenapp/ui/app/info/refer/refer_page.dart';
import 'package:tokenapp/ui/container/UIConstants/Colors.dart';
import 'package:tokenapp/ui/container/UIConstants/GSWidgetStyles.dart';
import 'package:tokenapp/ui/container/UIConstants/Strings.dart';
import 'package:tokenapp/widgets/widget_button.dart';
import 'package:tokenapp/widgets/widget_textfrom_field.dart';
import 'package:screenshot/screenshot.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  _FaqViewState createState() => _FaqViewState();
}

class _FaqViewState extends State<ContactPage> {
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
        body:  Container(
          height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleWidget(),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 40.0),
                      child: Column(
                        children: [
                          SizedBox(height: 30,),
                          Row(
                              children:[
                                SvgPicture.asset("images/icons/contact_us_msg.svg",width: 26,height: 26,),
                                SizedBox(width: 20.0,),
                                Expanded(child: Text("Fill out this form, We ‘ll quickly get back to you.")),

                              ]

                          ),
                          WidgetTextFormField(
                            formController: emailController,
                            inputType: TextInputType.text,
                            hintText: "Your Email Address",
                            margin:EdgeInsets.symmetric(horizontal: 0.0,vertical: 20.0),
                            hint: GSStrings.contact_us_full_name,
                          ),
                          WidgetTextFormField(
                            formController: emailController,
                            inputType: TextInputType.text,
                            hintText: "Your Message",
                            minLine: 5,
                            borderRadius: 16,
                            margin:EdgeInsets.symmetric(horizontal: 0.0,vertical: 2.0),
                            hint: GSStrings.contact_us_full_name,
                            isFieldExpanded: true,
                            maxLine: 5,
                          ),
                          WidgetButton(
                            title:"Send Message",
                            margin:EdgeInsets.symmetric(horizontal: 0.0,vertical: 24.0),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => (ReferPage()),
                                ),
                              );
                            },
                          ),
                        ],
                      )
                  )
                ],
              ),
            ),
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
          height: 450.0,
          width: double.maxFinite,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("images/bg_contactus.png"),
            ),
          ),
        ),
        SafeArea(child: Container(
          height: 400,
            margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Column(
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                elevation: 0.0,
                leading:Icon(Icons.arrow_back,color: Colors.grey,),
                  title: Text("Contact Us",style: TextStyle(color: Colors.black),),
                ),
                Expanded(
                  child: Container(
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: contuctListInfo.length,
                        itemBuilder: (BuildContext context,int index){
                          CotactUsModel model=contuctListInfo[index];
                          return FaqItemWidget(model);

                    })
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


