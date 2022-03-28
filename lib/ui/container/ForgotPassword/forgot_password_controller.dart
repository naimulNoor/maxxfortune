import 'package:get/get.dart';
import 'package:tokenapp/data/models/driver/driver_password_reset_code_response.dart';
import 'package:tokenapp/data/models/driver/driver_password_reset_response.dart';
import 'package:tokenapp/data/models/service_partner/auth/password_reset_code_request.dart';
import 'package:tokenapp/data/models/service_partner/auth/password_reset_request.dart';
import 'package:tokenapp/data/repository/service_partner_repository.dart';

class ForgotPasswordController extends GetxController{

  final Repository repository = Get.find();

  Future<DriverPasswordResetCodeResponse> sendPasswordResetCode(PasswordResetCodeRequest request) async{
    var response = await repository.requestGUPasswordResetCode(request);
    return response;
  }

  Future<DriverPasswordResetResponse> resetPassword(PasswordResetRequest request) async{
    var response = await repository.requestGUPasswordReset(request);
    return response;
  }

}