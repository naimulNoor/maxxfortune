import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tokenapp/ui/app/menu/menu.dart';


import 'package:tokenapp/utils/constants.dart';



class WidgetNavigation extends StatefulWidget {
  const WidgetNavigation({Key? key}) : super(key: key);

  @override
  State<WidgetNavigation> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<WidgetNavigation> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (_selectedIndex) {
        case 0:

          break;
        case 1:

          break;
        case 2:

          break;
        case 3:
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
            icon: SvgPicture.asset(AssetConstants.homeIcon,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetConstants.walletIcon,),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetConstants.specialIcon,),
            label: 'Special',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetConstants.menuIcon,),
            label: 'Menu',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
    );
  }
}
