import 'package:get/get.dart';
import 'package:tokenapp/data/models/driver/driver_password_reset_code_response.dart';
import 'package:tokenapp/data/models/driver/driver_password_reset_request.dart';
import 'package:tokenapp/data/models/driver/driver_password_reset_response.dart';
import 'package:tokenapp/data/repository/service_partner_repository.dart';

class ResetPasswordRequestController extends GetxController{
  
  final Repository repository = Get.find();

  Future<DriverPasswordResetCodeResponse>requestDriverPasswordResetCode() async {
    return await repository.requestDriverPasswordResetCode();
  }

  Future<DriverPasswordResetResponse> resetDriverLogin(DriverPasswordResetRequest request) async{
    var response = await repository.resetDriverPassword(request);
    return response;
  }
  
  
  
}