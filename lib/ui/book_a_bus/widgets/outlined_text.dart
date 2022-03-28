import 'package:flutter/material.dart';
import 'package:tokenapp/utils/colors.dart';
import 'package:tokenapp/utils/dimens.dart';

class OutlinedText extends StatelessWidget {

  final String text;
  final Function? onClick;

  const OutlinedText({Key? key, this.text = "Search address", this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(onClick!=null)
          onClick!();
      },
      child: Container(
        padding: EdgeInsets.all(dp10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              dp10,
            ),
          ),
          border: Border.all(
            color: light_grey,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: darkText,
            fontSize: dp18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
