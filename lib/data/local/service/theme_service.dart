import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tokenapp/constants.dart';
import 'package:tokenapp/util/lib/preference.dart';
import 'package:tokenapp/utils/colors.dart';

class ThemeService extends GetxService {
  late PreferenceUtil _preferenceUtil;

  @override
  void onInit() {
    super.onInit();

    // TODO: We will use the preference utility to persist chosen app theme
    _preferenceUtil = PreferenceUtil.on;
  }

  ThemeData get getTheme => Get.isDarkMode ? _darkTheme : _lightTheme;

  ThemeData get getLightTheme => _lightTheme;

  ThemeData get getDarkTheme => _darkTheme;

  void setLightTheme() {
    Get.changeTheme(_lightTheme);
  }

  void setDarkTheme() {
    Get.changeTheme(_darkTheme);
  }

  void toggleTheme() {
    Get.changeTheme(Get.isDarkMode ? _lightTheme : _darkTheme);
  }

  @override
  void onClose() {
    super.onClose();
  }
}

// Light style
/*
const lightAppBarTheme = const AppBarTheme(
  brightness: Brightness.light,
  backgroundColor: colorLightPrimary1,
  centerTitle: true,
  elevation: unit0,
  textTheme: TextTheme(
    headline6: const TextStyle(
      color: Colors.white,
      height: 1.5,
      fontSize: unit18,
      fontFamily: fontFamilyMulish,
      fontWeight: FontWeight.w800,
    ),
  ),
);

const lightBottomAppBarTheme = const BottomAppBarTheme(
  color: Colors.white,
  elevation: unit8,
  shape: CircularNotchedRectangle(),
);

const lightTabBarTheme = const TabBarTheme(
  labelColor: colorLightText1,
  unselectedLabelColor: colorLightText1,
  labelStyle: const TextStyle(
    fontSize: unit14,
    fontFamily: fontFamilyMulish,
    fontWeight: FontWeight.w700,
  ),
  unselectedLabelStyle: const TextStyle(
    fontSize: unit14,
    fontFamily: fontFamilyMulish,
    fontWeight: FontWeight.w400,
  ),
);

const lightBottomSheetTheme = const BottomSheetThemeData(
  modalBackgroundColor: Colors.white,
  shape: const RoundedRectangleBorder(
    borderRadius: const BorderRadius.only(
      topLeft: const Radius.circular(unit24),
      topRight: const Radius.circular(unit24),
    ),
  ),
);

const lightDividerTheme = const DividerThemeData(
  color: colorLightGray2,
  thickness: 0.7,
);

const lightSliderTheme = const SliderThemeData(
  inactiveTrackColor: colorLightGray3,
  activeTrackColor: colorProgress,
  thumbColor: Colors.white,
  inactiveTickMarkColor: Colors.transparent,
  activeTickMarkColor: Colors.transparent,
  trackHeight: unit8,
);
*/

const _lightFloatingActionButtonTheme = const FloatingActionButtonThemeData(
  backgroundColor: colorLightGray2,
  foregroundColor: colorLightOrange1,
);

const _lightBottomNavigationBarTheme = const BottomNavigationBarThemeData(
  backgroundColor: colorLightGray1,
  selectedItemColor: Colors.white,
  unselectedItemColor: colorLightGray3,
  selectedLabelStyle: const TextStyle(
    fontSize: 16.0,
    fontFamily: fontFamilyRoboto,
    fontWeight: FontWeight.w500,
  ),
  unselectedLabelStyle: const TextStyle(
    fontSize: 16.0,
    fontFamily: fontFamilyRoboto,
    fontWeight: FontWeight.w500,
    color: colorLightGray4,
  ),
);

const _lightTextTheme = const TextTheme(
  headline6: const TextStyle(
    color: colorLightGray3,
    fontSize: 18.0,
    fontFamily: fontFamilyRoboto,
    fontWeight: FontWeight.w700,
  ),
  headline5: const TextStyle(
    color: colorLightGray3,
    fontSize: 20.0,
    fontFamily: fontFamilyRoboto,
    fontWeight: FontWeight.w700,
  ),
  headline4: const TextStyle(
    color: colorLightGray3,
    fontSize: 24.0,
    fontFamily: fontFamilyRoboto,
    fontWeight: FontWeight.w700,
  ),
  headline3: const TextStyle(
    color: colorLightGray3,
    fontSize: 28.0,
    fontFamily: fontFamilyRoboto,
    fontWeight: FontWeight.w700,
  ),
  headline2: const TextStyle(
    color: colorLightGray3,
    fontSize: 32.0,
    fontFamily: fontFamilyRoboto,
    fontWeight: FontWeight.w700,
  ),
  headline1: const TextStyle(
    color: colorLightGray3,
    fontSize: 48.0,
    fontFamily: fontFamilyRoboto,
    fontWeight: FontWeight.w700,
  ),
  bodyText2: const TextStyle(
    color: colorLightGray3,
    fontSize: 16.0,
    fontFamily: fontFamilyRoboto,
    fontWeight: FontWeight.w400,
  ),
  bodyText1: const TextStyle(
    color: colorLightGray3,
    fontSize: 14.0,
    fontFamily: fontFamilyRoboto,
    fontWeight: FontWeight.w400,
  ),
  caption: const TextStyle(
    color: colorLightGray3,
    fontSize: 12.0,
    fontFamily: fontFamilyRoboto,
    fontWeight: FontWeight.w500,
  ),
);

final _lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  primaryColor: white,
  accentColor: accent,
  fontFamily: fontFamilyRoboto,
  floatingActionButtonTheme: _lightFloatingActionButtonTheme,
  bottomNavigationBarTheme: _lightBottomNavigationBarTheme,
  textTheme: _lightTextTheme,
  /*cardColor: colorLightPrimary2,
  dividerTheme: lightDividerTheme,
  indicatorColor: Colors.white,
  disabledColor: colorLightGray3,
  appBarTheme: lightAppBarTheme,
  bottomAppBarTheme: lightBottomAppBarTheme,
  tabBarTheme: lightTabBarTheme,
  bottomSheetTheme: lightBottomSheetTheme,
  sliderTheme: lightSliderTheme,
  iconTheme: IconThemeData(color: Colors.white),*/
);

// Dark style
/*const darkTextTheme = const TextTheme(
  headline5: const TextStyle(
    color: Colors.white,
    fontSize: unit24,
    fontFamily: fontFamilyMulish,
    fontWeight: FontWeight.w700,
  ),
  headline6: const TextStyle(
    color: Colors.white,
    height: 1.5,
    fontSize: unit20,
    fontFamily: fontFamilyMulish,
    fontWeight: FontWeight.w700,
  ),
  bodyText1: const TextStyle(
    color: Colors.white,
    height: 1.58,
    fontSize: unit14,
    fontFamily: fontFamilyMulish,
    fontWeight: FontWeight.w700,
  ),
  bodyText2: const TextStyle(
    color: Colors.white,
    height: 1.58,
    fontSize: unit14,
    fontFamily: fontFamilyMulish,
    fontWeight: FontWeight.w400,
  ),
  subtitle1: const TextStyle(
    color: colorDarkText1,
    height: 1.67,
    fontSize: unit12,
    fontFamily: fontFamilyMulish,
    fontWeight: FontWeight.w600,
  ),
  subtitle2: const TextStyle(
    color: colorDarkText2,
    height: 1.85,
    fontSize: unit14,
    fontFamily: fontFamilyMulish,
    fontWeight: FontWeight.w500,
  ),
  caption: const TextStyle(
    color: Colors.white,
    height: 1.33,
    fontSize: unit12,
    fontFamily: fontFamilyMulish,
    fontWeight: FontWeight.w700,
  ),
);

const darkAppBarTheme = const AppBarTheme(
  brightness: Brightness.dark,
  backgroundColor: colorDarkGray2,
  centerTitle: true,
  elevation: 0.0,
  textTheme: TextTheme(
    headline6: const TextStyle(
      color: Colors.white,
      fontSize: unit18,
      fontFamily: fontFamilyMulish,
      fontWeight: FontWeight.w800,
    ),
  ),
);

const darkBottomAppBarTheme = const BottomAppBarTheme(
  color: colorDarkGray2,
  elevation: unit8,
  shape: CircularNotchedRectangle(),
);

const darkBottomNavigationBarTheme = const BottomNavigationBarThemeData(
  backgroundColor: colorDarkGray2,
  selectedItemColor: colorDarkPrimary1,
  unselectedItemColor: colorDarkGray3,
  selectedLabelStyle: const TextStyle(
    fontSize: unit12,
    fontFamily: fontFamilyMulish,
    fontWeight: FontWeight.w800,
  ),
  unselectedLabelStyle: const TextStyle(
    fontSize: unit12,
    fontFamily: fontFamilyMulish,
    fontWeight: FontWeight.w800,
  ),
);

const darkTabBarTheme = const TabBarTheme(
  labelColor: Colors.white,
  unselectedLabelColor: Colors.white,
  labelStyle: const TextStyle(
    fontSize: unit14,
    fontFamily: fontFamilyMulish,
    fontWeight: FontWeight.w700,
  ),
  unselectedLabelStyle: const TextStyle(
    fontSize: unit14,
    fontFamily: fontFamilyMulish,
    fontWeight: FontWeight.w400,
  ),
);

const darkBottomSheetTheme = const BottomSheetThemeData(
  modalBackgroundColor: colorDarkGray1,
  shape: const RoundedRectangleBorder(
    borderRadius: const BorderRadius.only(
      topLeft: const Radius.circular(unit24),
      topRight: const Radius.circular(unit24),
    ),
  ),
);

const darkDividerTheme = const DividerThemeData(
  color: colorDarkGray5,
  thickness: 0.7,
);

const darkSliderTheme = const SliderThemeData(
  inactiveTrackColor: colorDarkGray4,
  activeTrackColor: colorProgress,
  thumbColor: Colors.white,
  inactiveTickMarkColor: Colors.transparent,
  activeTickMarkColor: Colors.transparent,
  trackHeight: unit8,
);*/

final _darkTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: fontFamilyRoboto,
/*  scaffoldBackgroundColor: colorDarkGray1,
  primaryColor: colorDarkPrimary1,
  accentColor: colorDarkPrimary2,
  indicatorColor: colorDarkGray4,
  cardColor: colorDarkGray5,
  disabledColor: colorDarkGray4,
  dividerTheme: darkDividerTheme,
  textTheme: darkTextTheme,
  appBarTheme: darkAppBarTheme,
  bottomAppBarTheme: darkBottomAppBarTheme,
  bottomNavigationBarTheme: darkBottomNavigationBarTheme,
  tabBarTheme: darkTabBarTheme,
  bottomSheetTheme: darkBottomSheetTheme,
  sliderTheme: darkSliderTheme,
  iconTheme: IconThemeData(color: Colors.white),*/
);
