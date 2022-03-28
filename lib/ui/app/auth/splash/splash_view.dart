import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tokenapp/constants.dart';
import 'package:tokenapp/ui/app/auth/splash/splash_controller.dart';


class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: colorSplashNavigationBarBackground,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        primary: false,
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.all(64.0),
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("images/ic_splash_background.png"),
            ),
          ),
          child: Center(
            child: Image.asset(
              "images/ic_splash_logo.png",
              height: 35.0,
              width: 180.0,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
