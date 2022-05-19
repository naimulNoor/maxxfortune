import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Utils/AppCustomColors.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: 380,
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: Colors.red, width: 1.0)),
        child: Column(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            SvgPicture.asset("images/ic_congrats.svg",height: 42,width: 42,),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              "Success",
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.black),
            ),
            const SizedBox(height: 10,),
            RichText(
              text: const TextSpan(children: [
                TextSpan(
                    text: "Token No ",
                    style: TextStyle(
                        fontSize: 15.0, fontWeight: FontWeight.normal, color: Colors.black)),
                TextSpan(
                    text: "1996999876",
                    style:
                    TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,color: Colors.black)),
              ]),
            ),
            const Text("& QR Code added to your wallet.", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal, color: Colors.black),textAlign: TextAlign.center,),
            const SizedBox(height: 20.0,),
            const Text("Share On", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.black),),
            const SizedBox(height: 10.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("images/twitter.png",height: 42.0, width: 42.0,),
                Image.asset("images/facebook.png",height: 42.0, width: 42.0,),
                Image.asset("images/pinterest.png",height: 42.0, width: 42.0,),
              ],
            ),
            const SizedBox(height: 20.0,),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Container(
                width: MediaQuery.of(context).size.width / 1.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  gradient: const LinearGradient(
                    begin: Alignment(-1.0, -2.0),
                    end: Alignment(1.0, 2.0),
                    colors: <Color>[
                      AppCustomColors.buttonStartColor,
                      AppCustomColors.buttonEndColor
                    ],
                  ),
                ),
                child: const Padding(padding: EdgeInsets.all(10.0), child: Text("Return to Home", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15.0, color: Colors.white), textAlign: TextAlign.center,)
                ),
              ),
            )
          ],
        ),
      );
  }
}