import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tokenapp/ui/ninja/DailyRewardScreen.dart';
import 'package:tokenapp/ui/ninja/DiscountScreen.dart';
import 'package:tokenapp/ui/ninja/RedeemCoinScreen.dart';
import 'package:tokenapp/ui/ninja/TokenScreen.dart';
import 'package:tokenapp/ui/ninja/VipScreen.dart';
import 'package:tokenapp/utils/AppCustomColors.dart';
import 'package:tokenapp/widgets/widget_navigation_container.dart';


class WalletTabPage extends StatefulWidget {
  const WalletTabPage({Key? key}) : super(key: key);

  @override
  State<WalletTabPage> createState() => _WalletTabPageState();
}

class _WalletTabPageState extends State<WalletTabPage> {

  /// Tabs
  final _tabs = <Tab>[
    const Tab(
      text: "Token",
    ),
    const Tab(
      text: "Reward",
    ),
    const Tab(
      text: "VIP",
    ),
  ];

  final _tabs_pages = <Widget>[
    const TokenPage(),
    const DailyRewardPage(),
    const VipPage(),
  ];

  @override
  void initState() {
    super.initState();
    //Timer.run(() {showDialog(context: context, builder: (_) => const DiscountPage());});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        bottomNavigationBar: WidgetNavigation("wallet",1),
          body: Column(
        children: [
          _bodyTop(),
          Expanded(
            child: _bodyBottom(),
          )
        ],
          ),
        ),
    );
  }

  /// Top Portion
  Widget _bodyTop() {
    return Container(
      color: AppCustomColors.pageStartColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "My Wallet",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 22.0,
                            color: AppCustomColors.textDarkColor),
                      ),
                      SizedBox(height: 4,),
                      Text(
                        "High Chances to Win Token",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15.0,
                            color: AppCustomColors.textLightColor),
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 6,
                  height: 24,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("/images/ic_coin.svg"),
                      const SizedBox(
                        width: 5.0,
                      ),
                      const Text(
                        "1.5K ",
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: AppCustomColors.textCoinColor),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RedeemCoinPage()),
                    );
                  },
                  child: Container(
                    height: 24,
                    width: 24,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppCustomColors.textDarkColor),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:11.6),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
                child: TabBar(tabs: _tabs, indicatorColor: AppCustomColors.buttonEndColor,labelColor: AppCustomColors.textDarkColor,unselectedLabelColor: AppCustomColors.textLightColor,indicatorWeight: 2,)),
          )
        ],
      ),
    );
  }

  /// Bottom Portion
  Widget _bodyBottom() {
    return TabBarView(children: _tabs_pages);
  }
}
