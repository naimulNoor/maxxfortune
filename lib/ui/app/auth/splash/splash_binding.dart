import 'package:get/get.dart';
import 'package:tokenapp/ui/app/auth/splash/splash_controller.dart';


class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
