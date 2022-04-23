
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tokenapp/constants.dart';
import 'package:tokenapp/utils/constants.dart';
class WidgetTopBar extends StatefulWidget {
  Container leftIcon;
  String centerImage;
  Row rightSection;
  String count;
  WidgetTopBar({Key? key, required this.leftIcon,required this.centerImage,required this.rightSection,required this.count}) : super(key: key);

  @override
  _WidgetTopBarState createState() => _WidgetTopBarState();
}

class _WidgetTopBarState extends State<WidgetTopBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(

                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                      gradient: LinearGradient(
                          colors: [
                           color_lightorange,
                           color_red,
                        ],
                        begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(1.0, 0.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                      ),
                      child: SvgPicture.asset(AssetConstants.notification)
                      ),
                      Positioned(
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 8,
                            child: CircleAvatar(backgroundColor: Colors.amber,radius: 6,)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
                child: Container(

                    child: Image.asset(widget.centerImage,height: 30,))),
            Expanded(
              flex: 1,
              child: Container(

                child: Row(
                  children: [
                    Row(
                      children: [
                        Image.asset("images/icons/lion.png",height: 40,width: 40,),
                        SizedBox(width: 5,),
                        Text(widget.count,style: TextStyle(color: colortitle,fontWeight: FontWeight.bold),)
                      ],
                    ),
                    SizedBox(width: 10,),
                    Icon(Icons.add_circle,color: Color(0xff11243D),size: 40.0,)
                  ],
                ),
              ),
          ),

        ],
      )
    );
  }
}
