import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tokenapp/ui/app/home/home_page.dart';
import 'package:tokenapp/ui/app/menu/menu.dart';
import 'package:tokenapp/ui/ninja/SpecialCampaignScreen.dart';
import 'package:tokenapp/ui/ninja/WalletTab/WalletTabScreen.dart';


import 'package:tokenapp/utils/constants.dart';



class WidgetNavigation extends StatefulWidget {
  final String path;
  int selectedIndex;
   WidgetNavigation(this.path,this.selectedIndex, {Key? key}) : super(key: key);

  @override
  State<WidgetNavigation> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<WidgetNavigation> {

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  late Widget home;
  late Widget wallet ;
  late Widget special ;
  late Widget menu ;

  @override
  void initState() {
    if(widget.path=="home"){
      home = SvgPicture.asset("images/icons/home_active.svg");
      wallet =SvgPicture.asset(AssetConstants.walletIcon);
      special =SvgPicture.asset(AssetConstants.specialIcon,);
      menu =SvgPicture.asset(AssetConstants.menuIcon,);
    }else if (widget.path=="wallet"){
      home =SvgPicture.asset(AssetConstants.homeIcon,);
      wallet =SvgPicture.asset("images/wallet_active.svg");
      special =SvgPicture.asset(AssetConstants.specialIcon,);
      menu =SvgPicture.asset(AssetConstants.menuIcon,);

    }else if (widget.path=="special"){
      home =SvgPicture.asset(AssetConstants.homeIcon,);
      wallet =SvgPicture.asset(AssetConstants.walletIcon);
      special =SvgPicture.asset("images/special_active.svg");
      menu =SvgPicture.asset(AssetConstants.menuIcon,);
    }
    else{
       home =SvgPicture.asset(AssetConstants.homeIcon,);
       wallet =SvgPicture.asset(AssetConstants.walletIcon);
       special =SvgPicture.asset(AssetConstants.specialIcon,);
       menu = SvgPicture.asset(AssetConstants.menu_active,);
    }
    super.initState();
  }
  void _onItemTapped(int index) {
    setState(() {
      widget.selectedIndex = index;
      switch (widget.selectedIndex) {
        case 0:
          widget.selectedIndex = 0;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => (HomePage()),
            ),
          );
          break;
        case 1:
          widget.selectedIndex = 1;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => (WalletTabPage()),
            ),
          );
          break;
        case 2:
          widget.selectedIndex = 2;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => (SpecialCampaignPage()),
            ),
          );
          break;
        case 3:
          widget.selectedIndex = 3;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => (WidgetMenu()),
            ),
          );
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return  BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.grey,
      items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: home,
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: wallet,
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: special,
            label: 'Special',
          ),
          BottomNavigationBarItem(
            icon: menu,
            label: 'Menu',
          ),
        ],
        currentIndex: widget.selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
    );
  }
}
