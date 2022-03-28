import 'dart:convert';

import 'package:get/get.dart';
import 'package:tokenapp/data/models/service_partner/auth/login/service_partner_login_request.dart';
import 'package:tokenapp/data/models/service_partner/auth/login/service_partner_login_response.dart';
import 'package:tokenapp/data/repository/service_partner_repository.dart';
import 'package:tokenapp/utils/constants.dart';
import 'package:tokenapp/utils/shared_pref_utils.dart';

class ServiceProviderLoginController extends GetxController{

  final Repository repository = Get.find();

  Future<ServicePartnerLoginResponse> loginServiceProvider(
      ServicePartnerLoginRequest request,
      ) async{
    var response = null;
    return response;
  }

  Future storeUser(ServicePartner servicePartner) async{
    String jsonString = json.encode(servicePartner.toJson());
    await SharedPrefUtil.writeString(PreferenceKey.servicePartner, jsonString);
  }

  Future storeToken(String token) async {
    token = "Bearer "+token;
    await SharedPrefUtil.writeString(NetworkConstants.AUTHORIZATION, token);
  }

}