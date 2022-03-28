import 'dart:convert';

import 'package:get/get.dart';
import 'package:tokenapp/data/models/general_user/general_user_login_request.dart';
import 'package:tokenapp/data/models/general_user/general_user_login_response.dart';
import 'package:tokenapp/data/repository/service_partner_repository.dart';
import 'package:tokenapp/utils/constants.dart';
import 'package:tokenapp/utils/shared_pref_utils.dart';

class SignInController extends GetxController{

  final Repository repository;

  SignInController(this.repository);


  Future storeUser(User user) async{
    String jsonString = json.encode(user.toJson());
    await SharedPrefUtil.writeString(NetworkConstants.GENERAL_USER_PROFILE, jsonString);
  }

  Future storeToken(String token) async {
    token = "Bearer "+token;
    await SharedPrefUtil.writeString(NetworkConstants.GENERAL_USER_TOKEN, token);
  }



}