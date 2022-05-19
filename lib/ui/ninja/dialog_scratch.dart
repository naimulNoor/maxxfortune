import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tokenapp/ui/ninja/CongratulationsScreen.dart';

class DialogScratchPage extends StatefulWidget {
  const DialogScratchPage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<DialogScratchPage> {

  @override
  void initState() {
      Future.delayed(Duration(seconds: 2), () {
        _openDialog();
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   return Container(
     width: 300,
     height: 340,
     decoration: BoxDecoration(
         color: Colors.white,
         borderRadius: BorderRadius.circular(15.0),
         border: Border.all(color: Colors.red, width: 1.0)),
     child: Padding(
       padding: const EdgeInsets.all(15.0),
       child: Column(
         children: [
           Row(
             children: [
               SvgPicture.asset("images/ic_gift.svg"),
               const SizedBox(width: 10.0,),
               Expanded(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: const [
                     Text(
                       "25 % Discount",
                       textAlign: TextAlign.start,
                       style: TextStyle(fontWeight: FontWeight.bold),
                     ),
                     SizedBox(height: 5.0,),
                     Text(
                       "Shop Dominos Pizza",
                       textAlign: TextAlign.start,
                     ),
                   ],
                 ),
               ),
               SvgPicture.asset("images/ic_starbucks.svg"),
             ],
           ),
           Padding(padding: const EdgeInsets.fromLTRB(0.0,15.0,0.0,8.0), child: Image.asset("images/scratch.png"),)
         ],
       ),
     ),
   );
  }

  void _openDialog() {

    Dialog dialog = Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), //this right here
      child: CongratulationPage(),
    );
    showDialog(context: context, builder: (BuildContext context) => dialog);}

}
