
import 'package:flutter/material.dart';

import 'package:tokenapp/ui/ninja/DailyRewardScreen.dart';
import 'package:tokenapp/ui/ninja/DiscountScreen.dart';
import 'package:tokenapp/ui/ninja/dialog_scratch.dart';
import 'package:tokenapp/ui/ninja/RedeemCoinScreen.dart';
import 'package:tokenapp/ui/ninja/SpecialCampaignScreen.dart';
import 'package:tokenapp/ui/ninja/TokenScreen.dart';
import 'package:tokenapp/ui/ninja/VipScreen.dart';
import 'package:tokenapp/ui/ninja/WalletTab/WalletTabScreen.dart';

class Routes {
  Routes._();

  //static variables
  static const String dialog_scratch = '/dialog_scratch';
  static const String discount = '/discount';
  static const String redeemCoin = '/redeemCoin';
  static const String dailyReward = '/dailyReward';
  static const String specialCampaign = '/specialCampaign';
  static const String token = '/token';
  static const String vip = '/vip';
  static const String wallet = '/wallet';

  static final routes = <String, WidgetBuilder>{
    dialog_scratch: (BuildContext context) => const DialogScratchPage(),
    discount: (BuildContext context) =>const DiscountPage(),
    redeemCoin: (BuildContext context) => const RedeemCoinPage(),
    dailyReward: (BuildContext context) => const DailyRewardPage(),
    specialCampaign: (BuildContext context) => const SpecialCampaignPage(),
    token: (BuildContext context) => const TokenPage(),
    vip: (BuildContext context) => const VipPage(),
    wallet: (BuildContext context) => const WalletTabPage(),
  };
}

