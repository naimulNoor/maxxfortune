import 'package:flutter/material.dart';
import 'package:tokenapp/ui/container/UIConstants/Colors.dart';
import 'package:tokenapp/ui/container/UIConstants/GSWidgetStyles.dart';
import 'package:tokenapp/ui/container/UIConstants/Strings.dart';
import 'package:tokenapp/ui/container/UIConstants/UISizeConstants.dart';
import 'dart:math' as math;

import 'package:tokenapp/utils/colors.dart';

class GSTextField extends StatelessWidget {
  String hints;

  final TextEditingController controller;
  final TextInputType type;
  GSTextField({required this.hints, required this.controller, this.type = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: GSSizes.size316x56.width,
      height: GSSizes.size316x56.height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(GSBorderRadius.radius8),
        border: Border.all(color: GSColors.gray_normal),
      ),
      child: TextField(
        keyboardType: type,
        controller: controller,
        decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            contentPadding: EdgeInsets.all(
              GSSizeConstants.padding16,
            ),
            hintText: hints),
        style: GSTextStyles.make18xw400Style(color: GSColors.gray_primary),
      ),
    );
  }
}

class GSPasswordTextField extends StatefulWidget {

  final TextEditingController controller;

  const GSPasswordTextField({Key? key, required this.controller}) : super(key: key);

  @override
  _GSPasswordTextFieldState createState() => _GSPasswordTextFieldState();
}

class _GSPasswordTextFieldState extends State<GSPasswordTextField> {

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: GSSizes.size316x56.width,
      height: GSSizes.size316x56.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(GSBorderRadius.radius8),
        border: Border.all(color: GSColors.gray_normal),
      ),
      child: TextField(
        controller: widget.controller,
        obscureText: !isVisible,
        decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            contentPadding: EdgeInsets.all(
              GSSizeConstants.padding16,
            ),
            hintText: GSStrings.password,
            suffixIcon: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(math.pi),
              child:IconButton(
                onPressed: (){
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                icon: Icon(
                  isVisible ? Icons.visibility_rounded : Icons.visibility_off,
                  color: grey,
                ),
              ),
            ),
            suffix: Padding(
              padding: const EdgeInsets.only(
                  top: GSSizeConstants.padding20,
                  right: GSSizeConstants.padding12),
              // myIcon is a 48px-wide widget.
            ),
        ),
        style: GSTextStyles.make18xw400Style(color: GSColors.gray_primary),
      ),
    );
  }
}
