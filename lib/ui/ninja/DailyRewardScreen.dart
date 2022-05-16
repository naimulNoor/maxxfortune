import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tokenapp/utils/AppCustomColors.dart';

import 'RewardScreen.dart';



class DailyRewardPage extends StatefulWidget {
  const DailyRewardPage({Key? key}) : super(key: key);

  @override
  State<DailyRewardPage> createState() => _DailyRewardPageState();
}

class _DailyRewardPageState extends State<DailyRewardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppCustomColors.backgroundColor,
        child: ListView.builder(
          itemBuilder: (context, item) => _listItem(),
          itemCount: 10,
        ),
      ),
    );
  }

  /// List Item
  Widget _listItem() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0,8.0,10.0,8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
              children: [
                SvgPicture.asset("images/ic_reward.svg"),
                const SizedBox(width: 10.0,),
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Daily Reward", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, color: AppCustomColors.textDarkColor),),
                    const SizedBox(height: 5.0,),
                    Container(
                      width: MediaQuery.of(context).size.width / 5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: AppCustomColors.pageStartColor),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("images/icons/lion.png",height: 18,width: 18,),
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
                    )
                  ],
                )),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    gradient:  const LinearGradient(
                      begin: Alignment(-1.0, -2.0),
                      end: Alignment(1.0, 2.0),
                      colors: <Color>[
                        AppCustomColors.buttonStartColor,
                        AppCustomColors.buttonEndColor
                      ],
                    ),
                  ),
                  child: InkWell(
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(8.0,5.0,8.0,5.0),
                      child: Text("Claim", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0, color: Colors.white,letterSpacing: 1),),
                    ),
                    onTap: () {
                      showDialog(context: context, builder: (context) { return _showDialog();});
                    },
                  ),
                )
              ],
          ),
        ),
      ),
    );
  }

  Widget _showDialog(){
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: RewardPage(),
    );
  }

}
