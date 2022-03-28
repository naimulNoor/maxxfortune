import 'package:flutter/material.dart';
import 'package:tokenapp/utils/colors.dart';
import 'package:tokenapp/utils/dimens.dart';

class TextFieldHeadline extends StatelessWidget {

  final String headline;

  const TextFieldHeadline({required this.headline});

  @override
  Widget build(BuildContext context) {
    return Text(
      headline,
      style: TextStyle(color: grey, fontSize: dp15),
    );
  }
}
