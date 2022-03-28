import 'package:get/get.dart';
import 'package:tokenapp/data/models/general_user/profile/general_user_profile_response.dart';
import 'package:tokenapp/data/repository/service_partner_repository.dart';

class ProfileScreenController extends GetxController{
  
  final Repository repository = Get.find();
  
  var profileState = Rx<GeneralUserProfileResponse?>(null);
  
  void getGeneralUserProfile() async{
    var response = await repository.getGeneralUserProfile();
    profileState.value = response;
  }
  
}