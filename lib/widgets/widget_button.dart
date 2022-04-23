import 'package:flutter/material.dart';

import '../constants.dart';

class WidgetButton extends StatefulWidget {
 String title;
 GestureTapCallback onTap;
 EdgeInsets margin;


  WidgetButton({required this.title, required this.onTap,required this.margin,});

  @override
  _WidgetButtonState createState() => _WidgetButtonState();
}

class _WidgetButtonState extends State<WidgetButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          margin: widget.margin,
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
              child: Text(widget.title,style: TextStyle(color: Colors.white),)),
        ),
      ),
    );
  }
}
