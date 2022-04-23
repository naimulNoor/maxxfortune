import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PhoneCallWidget extends StatelessWidget {

  final Widget child;
  final String number;

  const PhoneCallWidget({Key? key, required this.child, required this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        _launchURL("tel:$number");
      },
      child: child,
    );
  }

  void _launchURL(String number) async {
    if(number.isNotEmpty)
      if (!await launch(number)) throw 'Could not launch $number';
  }

}
