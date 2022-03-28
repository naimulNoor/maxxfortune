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
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Color(0xffDFDADA),
                    child: CircleAvatar(
                      radius: 28.0,
                    child: Icon(Icons.add,color: colortitle,size: 40.0,),backgroundColor: Colors.white,
                    )
                  ),
                  CircleAvatar(radius: 30.0,backgroundImage: AssetImage("images/avater_one.png"),),
                  CircleAvatar(radius: 30.0,backgroundImage: AssetImage("images/avater_two.png"),),
                  CircleAvatar(radius: 30.0,backgroundImage: AssetImage("images/avater_three.png"),),
                  CircleAvatar(radius: 30.0,backgroundImage: AssetImage("images/avater_four.png"),),
                ],
              )
            ],
          ),
        )
    );
  }
}
