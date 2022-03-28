import 'package:flutter/material.dart';
import 'package:tokenapp/utils/colors.dart';
import 'package:tokenapp/utils/dimens.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final TextInputType type;
  final Function? onTap;
  final bool enabled;
  final FocusNode? focusNode;

  const CommonTextField({
    required this.controller,
    this.hint = "",
    this.type = TextInputType.text,
    this.onTap,
    this.enabled = true,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      enabled: enabled,
      onTap: (){
        if(onTap!=null)
          onTap!();
      },
      keyboardType: type,
      controller: controller,
      style: TextStyle(
        color: darkText,
        fontSize: dp18,
        fontWeight: FontWeight.bold,
      ),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 10),
        hintText: hint,
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
      ),
      cursorColor: accent,
    );
  }
}
