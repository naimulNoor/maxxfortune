import 'package:get/get.dart';
import 'package:tokenapp/data/models/service_partner/profile/service_partner_profile_response.dart';
import 'package:tokenapp/data/repository/service_partner_repository.dart';

class ServiceProviderProfileController extends GetxController{

  final Repository repository = Get.find();

  ServiceProviderProfileController();

  Rx<ServicePartnerProfileResponse?> profileResponse = Rx<ServicePartnerProfileResponse?>(null);

  void getProfile() async {
    profileResponse.value=null;
    var response = await repository.getServicePartnerProfile();
    profileResponse.value = response;
  }

}