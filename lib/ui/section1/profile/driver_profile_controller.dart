import 'package:get/get.dart';
import 'package:tokenapp/data/models/driver/driver_profile_response.dart';
import 'package:tokenapp/data/repository/service_partner_repository.dart';

class DriverProfileController extends GetxController{

  final Repository repository = Get.find();

  Rx<DriverProfileResponse?> driverProfile = Rx<DriverProfileResponse?>(null);

  getDriverProfile() async{
    var response = await repository.getDriverProfile();
    driverProfile.value = response;

  }

}