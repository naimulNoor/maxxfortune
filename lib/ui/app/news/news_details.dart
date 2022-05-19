import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:tokenapp/data/models/container/FaqModel.dart';
import 'package:tokenapp/data/models/contuctus/model_contuct_us.dart';



class NewsDetailsPage extends StatefulWidget {
  const  NewsDetailsPage({Key? key}) : super(key: key);

  @override
  _FaqViewState createState() => _FaqViewState();
}

class _FaqViewState extends State<NewsDetailsPage> {
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

        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleWidget(),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  margin: EdgeInsets.fromLTRB(20, 80, 0, 0),

                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("24 May, 2020",style: TextStyle(color: Color(0xff95A0AE),fontSize: 13.0),),
                        SizedBox(height: 8,),
                        Container(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text("Fun Fall Craft Ideas for Mask New Life Toddlers.",style: TextStyle(color: Color(0xff11243D),fontSize: 20.0,fontWeight: FontWeight.w500),)
                        ),
                        SizedBox(height: 10,),
                        Container(
                            child: SingleChildScrollView(
                                child: Html(
                                  data: """
                                      <p>Enthusiastically revolutionize optimal supply chains without seamless processes. Intrinsicly build an expanded array of testing procedures Completely parallel task one-to-one materials via cooperative sources. Appropriately productize competitive growth strategies through compelling paradigms. Uniquely administrate bleedincompliant partnerships</p>
                                      """,
                                  style: {"body": Style(margin: EdgeInsets.zero, padding: EdgeInsets.zero,)}
                                ),
                              ))
                      ],
                    ),
                  )
              )
            ],
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
      clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          Stack(
            children: [
              Container(
                height: 230.0,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("images/bg_contactus.png"),
                  ),
                ),
              ),
              SafeArea(child: Container(
                  height: 185,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0.0,
                        leading: Icon(Icons.arrow_back,color: Colors.grey,),
                        title: Text("News",style: TextStyle(color:Colors.black),),
                        centerTitle: true,
                      ),

                    ],
                  ))),
            ],
          ),
          Positioned(
            bottom: -60,
            child: Container(
              width: 350,
              height: 185,
              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("images/news_demo.png")
                )
              ),
            ),
          ),


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


