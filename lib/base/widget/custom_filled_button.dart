import 'package:flutter/material.dart';
import 'package:tokenapp/ui/container/UIConstants/Colors.dart';
import 'package:tokenapp/ui/container/UIConstants/Fonts.dart';

class CustomFilledButton extends StatefulWidget {
  final String title;

  final Widget? child;
  final Color backgroundColor, textColor, borderColor;
  final GestureTapCallback onTap;
  final EdgeInsets margin, padding;
  final double borderRadius, fontSize;

  const CustomFilledButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.child,
    this.textColor = Colors.white,
    this.backgroundColor = GSColors.green_normal,
    this.borderColor = Colors.transparent,
    this.margin = const EdgeInsets.only(
      left: 20.0,
      right: 20.0,
      top: 12.0,
    ),
    this.padding = const EdgeInsets.all(16.0),
    this.borderRadius = 12.0,
    this.fontSize = 18.0,
  }) : super(key: key);

  @override
  _CustomFilledButtonState createState() => _CustomFilledButtonState();
}

class _CustomFilledButtonState extends State<CustomFilledButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      width: double.maxFinite,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: widget.padding,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: widget.borderColor),
            borderRadius: BorderRadius.all(
              Radius.circular(widget.borderRadius),
            ),
          ),
          backgroundColor: widget.backgroundColor,
        ),
        onPressed: widget.onTap,
        child: widget.child ??
            Text(
              widget.title,
              style: TextStyle(
                color: widget.textColor,
                fontSize: widget.fontSize,
                fontFamily: GSFonts.appFont,
                fontWeight: FontWeight.w600,
              ),
            ),
      ),
    );
  }
}
