import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tokenapp/ui/container/UIConstants/Colors.dart';
import 'package:tokenapp/ui/container/UIConstants/Fonts.dart';
import 'package:tokenapp/ui/container/UIConstants/GSWidgetStyles.dart';

class WidgetTextField extends StatefulWidget {
  final TextStyle textStyle;
  final String title;
  final EdgeInsets margin;




  const WidgetTextField({Key? key,required this.textStyle,required this.title,required this.margin
  }) : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<WidgetTextField> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0.0),
      child: Container(
        margin: widget.margin,
        child: Text(
          widget.title,
          style: widget.textStyle
        ),
      )
    );
  }
}
