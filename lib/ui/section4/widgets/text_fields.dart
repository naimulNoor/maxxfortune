import 'package:flutter/material.dart';
import 'package:tokenapp/ui/container/UIConstants/Colors.dart';
import 'package:tokenapp/ui/container/UIConstants/GSWidgetStyles.dart';
import 'package:tokenapp/ui/container/UIConstants/Strings.dart';
import 'package:tokenapp/ui/container/UIConstants/UISizeConstants.dart';
import 'dart:math' as math;

import 'package:tokenapp/utils/colors.dart';

class Sec4TextField extends StatelessWidget {
  final String hints;
  final TextEditingController controller;

  Sec4TextField({ required this.hints,  required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: GSSizes.size316x56.width,
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: GSSizes.size316x56.height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(GSBorderRadius.radius8),
        border: Border.all(color: GSColors.gray_normal),
      ),
      child: TextField(
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
            hintText: hints,
        ),
        style: GSTextStyles.make18xw400Style(
          color: GSColors.gray_primary,
        ),
      ),
    );
  }
}

class Sec4PasswordTextField extends StatefulWidget {

  final String hint;
  final TextEditingController controller;

  const Sec4PasswordTextField({this.hint = "Password",  required this.controller});

  @override
  _Sec4PasswordTextFieldState createState() => _Sec4PasswordTextFieldState();
}

class _Sec4PasswordTextFieldState extends State<Sec4PasswordTextField> {

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: GSSizes.size316x56.width,
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: GSSizes.size316x56.height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(GSBorderRadius.radius8),
        border: Border.all(color: GSColors.gray_normal),
      ),
      child: TextField(
        controller: widget.controller,
        obscureText: !isVisible,
        obscuringCharacter: '*',
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding: EdgeInsets.all(
            GSSizeConstants.padding16,
          ),
          hintText: widget.hint,
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

class Sec2PasswordTextField extends StatefulWidget {

  final String hint;
  final TextEditingController controller;

  const Sec2PasswordTextField({this.hint = "Password", required this.controller});

  @override
  _Sec2PasswordTextFieldState createState() => _Sec2PasswordTextFieldState();
}

class _Sec2PasswordTextFieldState extends State<Sec2PasswordTextField> {

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: GSSizes.size316x56.width,
      height: GSSizes.size316x56.height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(GSBorderRadius.radius8),
        border: Border.all(color: GSColors.gray_normal),
      ),
      child: TextField(
        controller: widget.controller,
        obscureText: !isVisible,
        obscuringCharacter: '*',
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding: EdgeInsets.all(
            GSSizeConstants.padding16,
          ),
          hintText: widget.hint,
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

class Sec4TextButton extends StatelessWidget {
  String text1;
  String text2;
  final Function? onClicked;

  Sec4TextButton({required this.text1, required this.text2, this.onClicked});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text1 + " ",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: GSFontSizes.font16),
          ),
          Text(
            text2,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: GSFontSizes.font16,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
      onPressed: () {
        if(onClicked!=null)
          onClicked!();
      },
    );
  }
}
