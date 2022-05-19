import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tokenapp/data/models/container/FaqModel.dart';
import 'package:tokenapp/data/models/contuctus/model_contuct_us.dart';
import 'package:tokenapp/ui/app/news/news_details.dart';



class NewsListPage extends StatefulWidget {
  const  NewsListPage({Key? key}) : super(key: key);

  @override
  _FaqViewState createState() => _FaqViewState();
}

class _FaqViewState extends State<NewsListPage> {
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
            TitleWidget(),
            Expanded(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: ListView.builder(
                    itemCount: 6,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, i) {
                      return InkWell(
                          onTap:(){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => (NewsDetailsPage()),
                              ),
                            );
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 0, 20),
                          decoration: BoxDecoration(

                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(5.0),
                                height: 100,
                                width: 150,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                        image: AssetImage("images/news_demo.png")
                                    )
                                ),
                              ),
                              SizedBox(width: 20.0,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("24 May, 2020",style: TextStyle(color: Color(0xff95A0AE),fontSize: 13.0),),
                                    SizedBox(height: 8,),
                                    Text("Fun Fall Craft Ideas for Mask New Life Toddlers.",style: TextStyle(color: Color(0xff11243D),fontSize: 15.0,fontWeight: FontWeight.w500),)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );

                    },
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
            height: 380.0,
            width: double.maxFinite,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("images/bg_contactus.png"),
              ),
            ),
          ),
          Container(
              height: 380,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                  Expanded(
                    child: Container(
                        margin: EdgeInsets.fromLTRB(32, 10, 0, 10),
                      child: ListView.builder(
                        itemCount: 6,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, i) {
                          return Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                            width: 245,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0)
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 141,
                                  width: 241,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0)),
                                      image: DecorationImage(
                                        image: AssetImage("images/news_demo.png")
                                      )
                                    ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 10.0,),
                                      Text("24 May, 2020",style: TextStyle(color: Color(0xff95A0AE),fontSize: 13.0,letterSpacing: 1),),
                                      SizedBox(height: 10.0,),
                                      Text("Fun Fall Craft Ideas for Mask New Life Toddlers.",style: TextStyle(color: Color(0xff11243D),fontSize: 15.0,fontWeight: FontWeight.w500),)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      )
                    ),
                  )
                ],
              )),
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


