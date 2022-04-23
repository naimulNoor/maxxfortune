
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tokenapp/constants.dart';
import 'package:tokenapp/utils/constants.dart';
class WidgetMenuListTile extends StatefulWidget {
  Color iconColor;
  String title;
  String subtitle;
  Color titleColor;
  Color subTitleColor;
  Widget icon;
  GestureTapCallback onTap;
  WidgetMenuListTile({Key? key,required this.onTap, required this.iconColor,required this.icon,required this.title,required this.subtitle,required this.titleColor,required this.subTitleColor}) : super(key: key);

  @override
  _WidgetTopBarState createState() => _WidgetTopBarState();
}

class _WidgetTopBarState extends State<WidgetMenuListTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        child:ListTile(
          leading: CircleAvatar(
            radius: 25,
            child: widget.icon,
          ),
          title: Text(widget.title,style: TextStyle(color: widget.subTitleColor,fontSize: 17,fontWeight: FontWeight.w500),),
          subtitle: Text(widget.subtitle,style: TextStyle(color: widget.subTitleColor,fontSize: 15,fontWeight: FontWeight.w400),),
        )
      ),
    );
  }
}
