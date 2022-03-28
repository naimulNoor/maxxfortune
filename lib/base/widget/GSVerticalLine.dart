import 'package:flutter/cupertino.dart';
import 'package:tokenapp/ui/container/UIConstants/Colors.dart';

class GSverticalLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Container(
        color: GSColors.gray_normal,
        height: 1,
        width: double.infinity,
      ),
    );
  }
}
