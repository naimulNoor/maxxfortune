import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tokenapp/routes.dart';
import 'package:tokenapp/utils/AppCustomColors.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import 'MembershipScreen.dart';

class VipPage extends StatefulWidget {
  const VipPage({Key? key}) : super(key: key);

  @override
  State<VipPage> createState() => _VipPageState();
}

class _VipPageState extends State<VipPage> {
  var result;

  @override
  void didChangeDependencies() async{

    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _addItem(),
            Expanded(
                child: ListView.builder(
                    itemBuilder: (context, position) => _listItem()))
          ],
        ),
      ),
    );
  }

  /// Add Item
  Widget _addItem() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () async{
          result=Navigator.pushNamed(
            context,
            Routes.addCard,
          );
          print("datad");
          print("${ await result}");
          if(await result=="success"){
            showCardDialog(context);
          }

        },
        child: Container(
          height: 80.0,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [
                AppCustomColors.pageStartColor,
                AppCustomColors.pageEndColor
              ]),
              borderRadius: BorderRadius.circular(10.0)),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0), color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 36,
                    width: 36,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [
                          AppCustomColors.buttonStartColor,
                          AppCustomColors.buttonEndColor
                        ]),
                        shape: BoxShape.circle),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  GradientText("Add a New Card",
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 15.0),
                      colors: const [
                        AppCustomColors.buttonStartColor,
                        AppCustomColors.buttonEndColor
                      ])
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// List Item
  Widget _listItem() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 8.0),
      child: Container(
        height: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: AppCustomColors.cardPinkColor
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0,15.0,15.0,15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Monthly Membership", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 22.0, color: Colors.white),),
                  SvgPicture.asset("images/ic_qr.svg")
                ],
              ),
            ),
            const SizedBox(height: 20.0,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Card Number", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0, color: Colors.white),),
                      Text("00033430003", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.white),),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text("Issuer", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0, color: Colors.white),),
                      Text("MTB Organization", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.white),),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


void showCardDialog(BuildContext context) {

  Dialog errorDialog = Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), //this right here
    child: MembershipPage(),
  );
  showDialog(context: context, builder: (BuildContext context) => errorDialog);}
