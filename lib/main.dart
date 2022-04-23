import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tokenapp/data/local/service/theme_service.dart';
import 'package:tokenapp/data/repository/service_partner_repository.dart';
import 'package:tokenapp/essential/translations.dart';
import 'package:tokenapp/routes.dart';
import 'package:tokenapp/ui/app/splash/splash.dart';
import 'package:tokenapp/utils/colors.dart';
import 'package:logger/logger.dart';


Logger logger = Logger();


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeAppEssentials();
  //await FcmService.initializeFCM();

  runApp(MyApp());
}


Future<void> initializeAppEssentials() async {
  Get.log('Starting services ...');

  Get.put(ThemeService());
  Get.put(Repository());


  Get.log('All services started...');
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: white,
      ),
    );

    return GetMaterialApp(
      translations: Messages(),
      locale: Locale('en'),
      routes: Routes.routes,
      fallbackLocale: Locale('en'),
      // TODO: Change this ThemeMode if force theme update is needed
      themeMode: ThemeMode.system,
      theme: Get.find<ThemeService>().getTheme,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      home: SplashScreen(),
      enableLog: kDebugMode,
    );
  }
}
