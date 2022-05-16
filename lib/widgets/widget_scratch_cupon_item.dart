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
        width: 160,
        height: 160,
        margin: EdgeInsets.only(top: 40.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),

            image:DecorationImage(
                opacity: 0.3,
                alignment: Alignment.topCenter,
                image: AssetImage("images/coupon.png")
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
                       crossAxisAlignment: CrossAxisAlignment.center,
                       mainAxisSize: MainAxisSize.max,
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                         Text("KFC",style: TextStyle(color: Color(0xff787B8C),fontWeight:FontWeight.w500,fontSize: 15),),
                         SizedBox(height: 5,),
                         Text("25 % OFF",style: TextStyle(color: Color(0xff11243D),fontWeight:FontWeight.w700,fontSize: 18),),
                         Container(
                  child: InkWell(
                    onTap: (){},
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      height: 48,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [color_lightorange,color_red],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(0.8, 0.0),
                            stops: [0.0, 5.0],
                            tileMode: TileMode.clamp
                        ),
                        borderRadius: BorderRadius.circular(50.0),

                      ),
                      child: Center(
                          child: Text("Scratch",style: TextStyle(color: Colors.white),)),
                    ),
                  ),
                )
                       ],
                     ),
                   )
                   ]),
              ),
            ),
            Positioned(
              top: -30,
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0)
                ),
                child: Center(
                  child: CircleAvatar(backgroundImage: AssetImage("images/company.png"),radius: 25.0,),
                ),
              ),
            ),
          ],
        )

    );
  }
}
