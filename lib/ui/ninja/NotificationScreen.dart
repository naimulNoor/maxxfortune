import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tokenapp/ui/ninja/ClaimRewardScreen.dart';
import 'package:tokenapp/ui/ninja/DailyRewardScreen.dart';
import 'package:tokenapp/ui/ninja/RewardScreen.dart';
import '../../Utils/AppCustomColors.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
            width: double.infinity,
            color: AppCustomColors.backgroundColor,
            child: Column(
              children: [
                _appBar(),
                _appBody(),
              ],
            ),
          )
      ),
    );
  }

  /// AppBar
  Widget _appBar(){
    return Container(
        height: 90.0,
        width: double.infinity,
        color: AppCustomColors.pageStartColor,
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0),
          child: Row(
            children: [
              InkWell(child: Icon(Icons.arrow_back_outlined, color: Colors.black,), onTap: () { Navigator.pop(context); },),
              Expanded(child: Text(
                "Notifications",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18.0,
                    color: AppCustomColors.textDarkColor),
                textAlign: TextAlign.center,
              ),)
            ],
          ),
        )
    );
  }

  /// AppBody
  Widget _appBody(){
    return Expanded(child: ListView.builder(itemBuilder: (context,position) => _listItem()));
  }

  /// ListItem
  Widget _listItem(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0,10.0,15.0,10.0),
      child: InkWell(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        height: 48.0,
                        width: 48.0,
                        decoration: BoxDecoration(
                            color: AppCustomColors.lightCreamBlue,
                            borderRadius: BorderRadius.circular(50.0)
                        ),
                        child: Icon(Icons.flag_rounded, color: Colors.white,),
                      ),
                      const SizedBox(width: 8.0,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  "Daily Reward",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18.0,
                                      color: AppCustomColors.textDarkColor),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(width: 5.0,),
                                Container(
                                  width: MediaQuery.of(context).size.width / 6,
                                  height: 25.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25.0),
                                      color: AppCustomColors.pageStartColor),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset("assets/images/ic_coin.svg"),
                                      const SizedBox(
                                        width: 3.0,
                                      ),
                                      const Text(
                                        "+50",
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold,
                                            color: AppCustomColors.textCoinColor),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const Text(
                              "Collaboratively harness high profile",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0,
                                  color: AppCustomColors.textLightColor),
                              textAlign: TextAlign.start,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8.0,),
                const Text(
                  "2 days ago",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13.0,
                      color: Colors.black26),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          showDialog(context: context, builder: (context) { return _showDialog();});
        },
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
