import 'package:flutter/material.dart';
import 'package:tokenapp/app_style.dart';

class WidgetInputOtpField extends StatelessWidget {
  EdgeInsets margin;
  WidgetInputOtpField({required this.margin});
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: this.margin,
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OTPDigitTextFieldBox(first: true, last: false),
              OTPDigitTextFieldBox(first: false, last: false),
              OTPDigitTextFieldBox(first: false, last: false),
              OTPDigitTextFieldBox(first: false, last: false),
              OTPDigitTextFieldBox(first: false, last: false),
              OTPDigitTextFieldBox(first: false, last: true),
            ],
          )
        ]),
      ),
    );
  }
}

class OTPDigitTextFieldBox extends StatelessWidget {
  final bool first;
  final bool last;
  const OTPDigitTextFieldBox(
      {Key? key, required this.first, required this.last})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,

          style: AppFontStyle.style_otp_field,
          decoration: InputDecoration(
            // contentPadding: EdgeInsets.all(0),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            counter: Offstage(),
            hintText: "",
          ),
        ),
      ),
    );
  }
}