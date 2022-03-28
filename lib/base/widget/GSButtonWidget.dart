import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tokenapp/ui/container/UIConstants/Colors.dart';
import 'package:tokenapp/ui/container/UIConstants/Strings.dart';
import 'package:tokenapp/ui/container/UIConstants/UISizeConstants.dart';

class GSButton extends StatelessWidget {
  String text;
  Function? onClick;

  GSButton({required this.text, this.onClick});

  @override
  Widget build(BuildContext context) {
    // return TextField(
    //   obscureText: true,
    //   decoration: InputDecoration(
    //     border: OutlineInputBorder(),
    //     labelText: 'Password',
    //   ),
    // );

    return OutlinedButton(
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: GSFontSizes.font18),
      ),
      style: OutlinedButton.styleFrom(
          primary: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(GSBorderRadius.radius8))),
          backgroundColor: GSColors.green_secondary,
          minimumSize: GSSizes.size316x56),
      onPressed: () {
        print('Pressed');
        if(onClick != null)
          onClick!();
      },
    );

    return OutlinedButton(
      onPressed: () {},
      child: Text('Looks like an OutlineButton'),
    );
  }
}

class GSButtonOutlineStock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return TextField(
    //   obscureText: true,
    //   decoration: InputDecoration(
    //     border: OutlineInputBorder(),
    //     labelText: 'Password',
    //   ),
    // );

    return OutlinedButton(
      child: Text(
        GSStrings.create_new_account,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: GSFontSizes.font18),
      ),
      style: OutlinedButton.styleFrom(
        primary: Colors.white,
        side: BorderSide(color: GSColors.gray_normal),
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(GSBorderRadius.radius8))),
        minimumSize: GSSizes.size316x56,
      ),
      onPressed: () {
        print('Pressed');
      },
    );

    return OutlinedButton(
      onPressed: () {},
      child: Text('Looks like an OutlineButton'),
    );
  }
}

class GSTextButton extends StatelessWidget {
  String text;
  final Function? onClick;

  GSTextButton({required this.text, this.onClick});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        text,
        style: TextStyle(
            color: GSColors.gray_secondary,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: GSFontSizes.font16),
      ),
      onPressed: () {
        if(onClick!=null)
          onClick!();
      },
    );

    return OutlinedButton(
      onPressed: () {},
      child: Text('Looks like an OutlineButton'),
    );
  }
}
