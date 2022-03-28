import 'dart:io';

import 'package:get/get.dart';
import 'package:tokenapp/data/models/general_user/profile/profile_update_request.dart';
import 'package:tokenapp/data/models/general_user/profile/profile_update_response.dart';
import 'package:tokenapp/data/repository/service_partner_repository.dart';

class EditProfileController extends GetxController{

  final Repository _repository = Get.find();

  Future<UpdateProfileResponse> updateUserProfile(
    File? userImage,
    File? careTakerImage,
    UpdateProfileRequest request,
  ) async{
    return await _repository.updateGeneralUserProfile(
      userImage,
      careTakerImage,
      request,
    );
  }

}