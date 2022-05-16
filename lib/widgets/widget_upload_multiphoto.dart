import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tokenapp/ui/container/UIConstants/Colors.dart';
import 'package:tokenapp/ui/container/UIConstants/Fonts.dart';
import 'package:tokenapp/ui/container/UIConstants/GSWidgetStyles.dart';

import '../constants.dart';

class WidgetUploadMultiPhotos extends StatefulWidget {



  const WidgetUploadMultiPhotos({Key? key,}) : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<WidgetUploadMultiPhotos> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(0.0),
        child: Container(
          margin:EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Upload Photos",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16),),
              SizedBox(height: 10,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30.0,
                      backgroundColor: Color(0xffDFDADA),
                      child: CircleAvatar(
                        radius: 28.0,
                      child: Icon(Icons.add,color: colortitle,size: 40.0,),backgroundColor: Colors.white,
                      )
                    ),
                    SizedBox(width: 5.0,),
                    CircleAvatar(radius: 30.0,backgroundImage: AssetImage("images/avater_one.png"),),
                    SizedBox(width: 5.0,),
                    CircleAvatar(radius: 30.0,backgroundImage: AssetImage("images/avater_two.png"),),
                    SizedBox(width: 5.0,),
                    CircleAvatar(radius: 30.0,backgroundImage: AssetImage("images/avater_three.png"),),
                    SizedBox(width: 5.0,),
                    CircleAvatar(radius: 30.0,backgroundImage: AssetImage("images/avater_four.png"),),
                    SizedBox(width: 5.0,),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
