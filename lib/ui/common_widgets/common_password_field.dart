import 'package:flutter/material.dart';
import 'package:tokenapp/ui/container/UIConstants/UISizeConstants.dart';
import 'package:tokenapp/utils/colors.dart';
import 'package:tokenapp/utils/dimens.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

class CommonPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;

  const CommonPasswordField({required this.controller, this.hint = ""});

  @override
  _CommonPasswordFieldState createState() => _CommonPasswordFieldState();
}

class _CommonPasswordFieldState extends State<CommonPasswordField> {

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: !isVisible,
      controller: widget.controller,
      style: TextStyle(
        color: darkText,
        fontSize: dp18,
        fontWeight: FontWeight.bold,
      ),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 10),
        hintText: widget.hint,
        hintStyle: GoogleFonts.manrope(
            color: grey,
            fontSize: 14
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(dp10),
          borderSide: BorderSide(color: grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(dp10),
          borderSide: BorderSide(color: accent),
        ),
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
      cursorColor: accent,
    );
  }
}
