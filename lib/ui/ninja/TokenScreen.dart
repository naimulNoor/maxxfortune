import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tokenapp/routes.dart';

import 'package:tokenapp/utils/AppCustomColors.dart';

class TokenPage extends StatefulWidget {
  const TokenPage({Key? key}) : super(key: key);

  @override
  _TokenPageState createState() => _TokenPageState();
}

class _TokenPageState extends State<TokenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppCustomColors.backgroundColor,
        child: ListView.builder(itemBuilder: (context,position) => _listItem(), itemCount: 10,),
      ),
    );
  }

  /// ListItem
  Widget _listItem(){
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, Routes.scanScreen);
      },
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0, bottom: 5.0),
            child: Container(
              height: 120.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0), color: Colors.white),
            ),
          ),
          Positioned(
            child: Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppCustomColors.backgroundColor),
            ),
            bottom: 25,
            left: 0,
          ),
          Positioned(
            child: Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppCustomColors.backgroundColor),
            ),
            bottom: 25,
            right: 0,
          ),
          const Positioned(
            child: DottedLine(
              direction: Axis.horizontal,
              lineThickness: 1.0,
              dashLength: 8.0,
              dashColor: AppCustomColors.dividerColor,
            ),
            bottom: 35,
            left: 20,
            right: 20,
          ),
          Positioned(
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0,right: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(text: const TextSpan(children: [
                    TextSpan(text: "Shop : ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15.0, color: AppCustomColors.textLightColor)),
                    TextSpan(text: "McDonalds", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0, color: AppCustomColors.textDarkColor)),
                  ])),
                  RichText(text: const TextSpan(children: [
                    TextSpan(text: "Expire : ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15.0, color: AppCustomColors.textLightColor)),
                    TextSpan(text: "27 Dec, 21", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0, color: AppCustomColors.textDarkColor)),
                  ])),
                ],
              ),
            ),
            bottom: 10,
            left: 0,
            right: 0,
          ),
          Positioned(child: Padding(
            padding: const EdgeInsets.only(left: 30.0,right: 30.0),
            child: Row(
              children: [
                SvgPicture.asset("assets/images/ic_starbucks.svg"),
                const SizedBox(width: 10.0,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("#9958686", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15.0, color: AppCustomColors.textLightColor),),
                      SizedBox(height: 5.0,),
                      Text("Enjoy 25 % Discount",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, color: AppCustomColors.textDarkColor),),
                    ],
                  ),
                ),
                SvgPicture.asset("assets/images/ic_procced.svg"),
              ],
            ),
          ), top: 20, left: 0, right: 0,)
        ],
      ),
    );
  }

}
