import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../Utils/AppCustomColors.dart';

class RewardPage extends StatefulWidget {
  const RewardPage({Key? key}) : super(key: key);

  @override
  State<RewardPage> createState() => _RewardPageState();
}

class _RewardPageState extends State<RewardPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 350,
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: Colors.red, width: 1.0)),
      child: Column(
        children: [
          const SizedBox(
            height: 10.0,
          ),
          Image.asset("images/crown.png"),
          const Text(
            "Daily Reward",
            textAlign: TextAlign.start,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.black),
          ),
          const SizedBox(height: 5.0,),
          Container(
            width: MediaQuery.of(context).size.width / 5,
            height: 25.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: AppCustomColors.pageStartColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/images/ic_coin.svg"),
                const SizedBox(
                  width: 5.0,
                ),
                const Text(
                  "+50",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: AppCustomColors.textCoinColor),
                )
              ],
            ),
          ),
          const SizedBox(height: 10,),
          const Text("Uniquely Communicate Real-Time", style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.normal, color: Colors.black),),
          const Text("\"Outside the Box\" Thinking", style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.normal, color: Colors.black),),
          const SizedBox(height: 25.0,),
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
              child: const Padding(padding: EdgeInsets.all(15.0), child: Text("Claim Reward", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15.0, color: Colors.white), textAlign: TextAlign.center,)
              ),
            ),
          )
        ],
      ),
    );
  }
}
