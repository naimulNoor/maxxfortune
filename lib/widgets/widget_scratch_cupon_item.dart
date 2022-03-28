import 'package:flutter/material.dart';
import 'package:tokenapp/utils/constants.dart';
import 'package:tokenapp/widgets/widget_button.dart';

import '../constants.dart';

class WidgetScratchCuponItem extends StatefulWidget {
 String title;
 String couponPercentise;
 String buttonText;
 String heaserImage;
 String bgImage;


 WidgetScratchCuponItem({required this.title, required this.couponPercentise,required this.buttonText,required this.heaserImage,required this.bgImage});

  @override
  _WidgetButtonState createState() => _WidgetButtonState();
}

class _WidgetButtonState extends State<WidgetScratchCuponItem> {
  @override
  Widget build(BuildContext context) {
    return Container(

        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color_lightorange,color_red],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(0.8, 0.0),
                stops: [0.0, 5.0],
                tileMode: TileMode.clamp
            ),
            borderRadius: BorderRadius.circular(20.0),
            image:DecorationImage(
                image: AssetImage(AssetConstants.signup_bg_image)
            )
        ),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [

            Container(
              width: 153,
              height: 165,
              margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
              child:Container(
                 child: Stack(
                   children:[

                   Container(
                     child: Column(
                       children: [
                         Text("KFC"),
                         Text("25 % OFF"),
                         WidgetButton(
                           title:"Scratch",
                           onTap: (){},
                           margin: EdgeInsets.all(10.0),
                         )
                       ],
                     ),
                   )
                   ]),
              ),
            ),
            Positioned(
              top: -20,
              child: Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(15.0)
                ),
                child: Center(
                  child: CircleAvatar(),
                ),
              ),
            ),
          ],
        )

    );
  }
}
