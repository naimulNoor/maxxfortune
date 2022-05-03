import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tokenapp/utils/AppCustomColors.dart';
import 'package:tokenapp/widgets/widget_navigation_container.dart';

class SpecialCampaignPage extends StatefulWidget {
  const SpecialCampaignPage({Key? key}) : super(key: key);

  @override
  _SpecialCampaignPageState createState() => _SpecialCampaignPageState();
}

class _SpecialCampaignPageState extends State<SpecialCampaignPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: WidgetNavigation("special",2),
      body: Column(
        children: [
          _appBar(),
          _body(),
        ],
      ),
    );
  }

  /// Appbar
  Widget _appBar(){
    return Container(
      width: MediaQuery.of(context).size.width,
      color: AppCustomColors.pageStartColor,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15.0,25.0,15.0,25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(height: 20,),
            Text("Special Campaign", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30.0,color: AppCustomColors.textDarkColor),),
            SizedBox(height: 10.0,),
            Text("High Chances of Winning Token", style: TextStyle(fontWeight: FontWeight.normal,fontSize: 15.0,color: AppCustomColors.textLightColor),)
          ],
        ),
      ),
    );
  }

  /// Body Data
  Widget _body(){
    return Expanded(child: Container(
        color: Colors.white,
        child: ListView.builder(itemBuilder: (context,position) => _listItem(), itemCount: 10,),
    ));
  }

  /// List Item
  Widget _listItem(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0,15.0,15.0,5.0),
      child: Container(
        height: 140,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.red
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0,15.0,25.0,12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("StarBucks", style: TextStyle(fontWeight: FontWeight.normal,fontSize: 18.0, color: Colors.white),),
                  SvgPicture.asset("images/ic_starbucks.svg")
                ],
              ),
            ),
            Padding(padding: const EdgeInsets.fromLTRB(25.0,12.0,25.0,15.0), child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Member ID", style: TextStyle(fontWeight: FontWeight.w100, color: Colors.white, fontSize: 15.0),),
                    SizedBox(height: 5.0,),
                    Text("00033430003", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15.0),),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Expire", style: TextStyle(fontWeight: FontWeight.w100, color: Colors.white, fontSize: 15.0),),
                    SizedBox(height: 5.0,),
                    Text("09/24", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15.0),),
                  ],
                ),
              ],
            ),)
          ],
        ),
      ),
    );
  }

}
