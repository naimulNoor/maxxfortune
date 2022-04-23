import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tokenapp/app_style.dart';
import 'package:tokenapp/data/models/container/FaqModel.dart';
import 'package:tokenapp/ui/app/info/contact/contact_page.dart';


class FaqPage extends StatefulWidget {
  const FaqPage({Key? key}) : super(key: key);

  @override
  _FaqViewState createState() => _FaqViewState();
}

class _FaqViewState extends State<FaqPage> {



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
              child: FutureBuilder<FaqModel>(
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    return FaqListWidget(data:snapshot.data);

                  }
                  return Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Center(child: CircularProgressIndicator()));

                }
              ),
            ),
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
          height: 200.0,
          width: double.maxFinite,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("images/header_faq.png"),
            ),
          ),
        ),
        SafeArea(child: Container(
            margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Icon(Icons.arrow_back,color: Colors.grey,))),

      ],

    );
  }
}

class FaqListWidget extends StatelessWidget {
  FaqModel? data;
  FaqListWidget({required this.data});
  FaqModel? newdata;
  List<FaqData> newLIst = List<FaqData>.empty(growable: true);

  @override
  Widget build(BuildContext context) {

    filterCategoryName(data);
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context,i){
           return Padding(
             padding: const EdgeInsets.all(8.0),
             child: FaqItemWidget(
          ),
           );

    }
    );

  }

  void filterCategoryName(FaqModel? data) {
    newLIst.addAll(data!.data);
    newLIst=uniqifyList(newLIst);



  }
}

List<FaqData> uniqifyList(List<FaqData> list) {
  final ids = Set();
  list.retainWhere((x) => ids.add(x.categoryId));
  return list;

  }








class FaqItemWidget extends StatefulWidget {

  @override
  State createState() => CustomExpansionTileState();
}

class CustomExpansionTileState extends State<FaqItemWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        title: Container(
          child: InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => (ContactPage()),
                ),
              );
            },
            child: Text(
              "Find on the marketplace?",
              style: AppFontStyle.style_faq_header(color: Color(0xff11243D))
            ),
          ),
        ),
        trailing: isExpanded ? Image.asset("images/faq_close.png",fit: BoxFit.fill,) : Image.asset("images/faq_open.png",),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text("Enthusiastically revolutionize optimal supply chains without seamless processes. Intrinsicly build an expanded procedures.",
              style:  AppFontStyle.style_faq_details(color: Color(0xff4D5466)),
            ),
          ),
        ],
        onExpansionChanged: (bool expanding) => setState(() => this.isExpanded = expanding),
      ),
    );
  }
}


