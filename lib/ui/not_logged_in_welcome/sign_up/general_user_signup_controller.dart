import 'package:get/get.dart';
import 'package:tokenapp/data/models/general_user/general_user_signup_request.dart';
import 'package:tokenapp/data/models/general_user/general_user_signup_response.dart';
import 'package:tokenapp/data/repository/service_partner_repository.dart';

class GeneralUserSignupController extends GetxController {
  final Repository repository = Get.find();

  Future<GeneralUserSignupResponse> signupGeneralUser(
      GeneralUserSignupRequest request) async {
    var response = await repository.signupGeneralUser(request);
    return response;
  }
}