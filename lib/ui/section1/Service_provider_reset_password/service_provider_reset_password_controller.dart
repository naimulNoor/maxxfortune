import 'package:get/get.dart';
import 'package:tokenapp/data/models/driver/driver_password_reset_code_response.dart';
import 'package:tokenapp/data/models/driver/driver_password_reset_response.dart';
import 'package:tokenapp/data/models/service_partner/auth/password_reset_code_request.dart';
import 'package:tokenapp/data/models/service_partner/auth/password_reset_request.dart';
import 'package:tokenapp/data/repository/service_partner_repository.dart';

class ServiceProviderResetPasswordController extends GetxController{

  final Repository repository;

  ServiceProviderResetPasswordController(this.repository);

  Future<DriverPasswordResetCodeResponse> sendPasswordResetCode(PasswordResetCodeRequest request) async{
    var response = await repository.requestSPPasswordResetCode(request);
    return response;
  }

  Future<DriverPasswordResetResponse> resetPassword(PasswordResetRequest request) async{
    var response = await repository.requestSPPasswordReset(request);
    return response;
  }


}