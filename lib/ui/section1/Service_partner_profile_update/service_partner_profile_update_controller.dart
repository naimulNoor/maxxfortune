import 'dart:io';

import 'package:get/get.dart';
import 'package:tokenapp/data/models/service_partner/profile/service_partner_profile_update_request.dart';
import 'package:tokenapp/data/models/service_partner/profile/service_partner_profile_update_response.dart';


class ServicePartnerProfileUpdateController extends GetxController{

  var response = null;

  Future<ServicePartnerProfileUpdateResponse> updateProfile(ServicePartnerProfileUpdateRequest request, File? file) async{
    var response = null;
    return response;
  }

}