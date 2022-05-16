
import 'package:flutter/material.dart';
import 'package:tokenapp/ui/ninja/AddCardScreen.dart';
import 'package:tokenapp/ui/ninja/ClaimRewardScreen.dart';
import 'package:tokenapp/ui/ninja/ClaimScreenOne.dart';
import 'package:tokenapp/ui/ninja/ClaimScreenTwo.dart';
import 'package:tokenapp/ui/ninja/CongratulationsScreen.dart';
import 'package:tokenapp/ui/ninja/CreateAccountScreenOne.dart';
import 'package:tokenapp/ui/ninja/CreateAccountScreenTwo.dart';

import 'package:tokenapp/ui/ninja/DailyRewardScreen.dart';
import 'package:tokenapp/ui/ninja/DiscountScreen.dart';
import 'package:tokenapp/ui/ninja/EarnCreditScreen.dart';
import 'package:tokenapp/ui/ninja/MembershipScreen.dart';
import 'package:tokenapp/ui/ninja/NotificationScreen.dart';
import 'package:tokenapp/ui/ninja/RewardScreen.dart';
import 'package:tokenapp/ui/ninja/ScanScreen.dart';
import 'package:tokenapp/ui/ninja/SuccessScreen.dart';
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

  static const String addCard = '/addCard';
  static const String claimOne = '/claimOne';
  static const String claimTwo = '/claimTwo';
  static const String earnCredit = '/earnCredit';
  static const String membership = '/membership';
  static const String scanScreen = '/scanScreen';
  static const String claimReward = '/claimReward';
  static const String congratulation= '/congratulation';
  static const String createAccOne = '/createAccountScreenOne';
  static const String createAccTwo = '/createAccountScreenTwo';
  static const String notifications = '/notifications';
  static const String givenReward = '/givenReward';
  static const String success = '/success';

  static final routes = <String, WidgetBuilder>{

    dialog_scratch: (BuildContext context) => const DialogScratchPage(),
    discount: (BuildContext context) =>const DiscountPage(),
    redeemCoin: (BuildContext context) => const RedeemCoinPage(),
    dailyReward: (BuildContext context) => const DailyRewardPage(),
    specialCampaign: (BuildContext context) => const SpecialCampaignPage(),
    token: (BuildContext context) => const TokenPage(),
    vip: (BuildContext context) => const VipPage(),
    wallet: (BuildContext context) => const WalletTabPage(),

    addCard: (BuildContext context) => const AddCardPage(),
    claimOne: (BuildContext context) => const ClaimPageOne(),
    claimTwo: (BuildContext context) => const ClaimTwoPage(),
    earnCredit: (BuildContext context) => const EarnCreditPage(),
    membership: (BuildContext context) => const MembershipPage(),
    scanScreen: (BuildContext context) => const ScanPage(),

    claimReward: (BuildContext context) => const ClaimRewardPageWithCheck(),
    congratulation: (BuildContext context) => const CongratulationPage(),
    createAccOne: (BuildContext context) => const CreateAccountOneScreenPage(),
    createAccTwo: (BuildContext context) => const CreateAccountThreeScreenPage(),
    notifications: (BuildContext context) => const NotificationPage(),
    givenReward: (BuildContext context) => const RewardPage(),
    success: (BuildContext context) => const SuccessScreen(),
  };
}

