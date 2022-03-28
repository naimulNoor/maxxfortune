
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:tokenapp/data/local/service/theme_service.dart';
import 'package:tokenapp/data/repository/service_partner_repository.dart';
import 'package:tokenapp/essential/translations.dart';
import 'package:tokenapp/ui/app/auth/login/login_page.dart';
import 'package:tokenapp/ui/app/home/home_page.dart';
import 'package:tokenapp/ui/app/info/profile.dart';
import 'package:tokenapp/ui/app/info/refer/refer_page.dart';
import 'package:tokenapp/ui/app/menu/account_settings.dart';
import 'package:tokenapp/ui/app/menu/update_information.dart';

import 'package:tokenapp/ui/book_a_bus/booking_controller.dart';
import 'package:tokenapp/ui/section1/service_provider_profile/service_provider_profile_controller.dart';
import 'package:tokenapp/ui/section1/service_provider_vehicle_list/service_provider_vehicle_list_controller.dart';
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
  Get.put(ServiceProviderProfileController());
  Get.put(ServiceProviderVehicleListController());
  Get.put(BookingController(Get.find()));

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
      fallbackLocale: Locale('en'),
      // TODO: Change this ThemeMode if force theme update is needed
      themeMode: ThemeMode.system,
      theme: Get.find<ThemeService>().getTheme,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      home: UpdateInformationPage(),
      enableLog: kDebugMode,
    );
  }
}
