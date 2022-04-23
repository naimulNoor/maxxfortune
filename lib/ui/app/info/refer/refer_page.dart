import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tokenapp/app_style.dart';
import 'package:tokenapp/data/localdata.dart';
import 'package:tokenapp/data/models/container/FaqModel.dart';
import 'package:tokenapp/data/models/container/contactus/ContactUsModel.dart';
import 'package:tokenapp/data/models/contuctus/model_contuct_us.dart';


class ReferPage extends StatefulWidget {
  const ReferPage({Key? key}) : super(key: key);

  @override
  _FaqViewState createState() => _FaqViewState();
}

class _FaqViewState extends State<ReferPage> {
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

        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 0,
                child: TitleWidget()),
            Expanded(
                flex: 1,
                child:  Container(
                      padding: EdgeInsets.symmetric(horizontal: 40.0),
                      margin: EdgeInsets.fromLTRB(0, 50, 0, 0),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Column(
                            children: [
                              Text("REFERRAL CODE",style: TextStyle(
                                fontSize: 10.0,
                                color: Colors.black

                              ),),
                              SizedBox(height: 15,),
                              Text("8Q9335",style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 34.0,
                                  fontWeight: FontWeight.bold
                              ),),
                              SizedBox(height: 50,),
                              Text("REFERRAL LINK",style: TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.black

                              ),),
                              SizedBox(height: 12,),
                              Text("http://q.tokn.sg/8Q9335",style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black

                              ),),
                              SizedBox(height: 12,),
                              Container(
                                height: 32,
                                width: 88,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50.0),
                                    border: Border.all(color: Colors.grey)
                                ),
                                child: Center(child: Text("Copy Link",style: TextStyle(
                                    fontSize: 12.0
                                ),)),
                              ),
                            ],
                          ),
                          Container(
                            height: 60,
                            width: 400,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:AssetImage("images/refer_price_bg.png",)
                                )
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Wow! You made it",style: TextStyle(color: Colors.white,fontSize: 12.0),),
                                SizedBox(height: 2,),
                                Container(
                                    width: 180,
                                    child: Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(text: 'You have won ',style: TextStyle(fontSize: 10,color: Colors.white,)),
                                          TextSpan(text: '5 days free trail', style: TextStyle(color:Color(0xffFF8800),fontSize: 10,fontWeight: FontWeight.bold),),
                                          TextSpan(text: ' of the daily diet plan. Enjoy!',style:TextStyle(fontSize: 10,color: Colors.white,), ),
                                        ],
                                      ),
                                      textAlign: TextAlign.center,
                                    ),)

                              ],
                            ),
                          )
                          
                        ],
                      )
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
            height: 300.0,
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
                        children: [
                         Container(child: Image.asset("images/refer_header_icon.png",height: 100,width: 100,fit: BoxFit.fill,)),
                          SizedBox(height: 10.0,),
                          Container(
                            width:300,
                            child: Text(
                              "Refer your Friends and Earn 100 coins Per invite",
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
                                fontSize: 13.0,
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


