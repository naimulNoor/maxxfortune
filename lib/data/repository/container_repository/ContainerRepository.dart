

import 'dart:convert';

import 'package:tokenapp/core/network/api_base_helper.dart';
import 'package:tokenapp/core/network/dio_factory.dart';
import 'package:tokenapp/data/models/MessageResponse.dart';
import 'package:tokenapp/data/models/container/AboutUsModel.dart';
import 'package:tokenapp/data/models/container/FaqModel.dart';
import 'package:tokenapp/data/models/container/contactus/ContactUsModel.dart';
import 'package:tokenapp/data/models/container/contactus/ContactUsResponse.dart';

import 'package:tokenapp/data/models/container/SettingsModel.dart';
import 'package:tokenapp/data/models/container/lostandfound/LostAndFoundModel.dart';
import 'package:tokenapp/data/models/container/lostandfound/LostAndFoundResponse.dart';
import 'package:tokenapp/utils/constants.dart';
import 'package:logger/logger.dart';

class ContainerRepository{

  final ApiBaseHelper helper = ApiBaseHelper(dioFactory: DioFactory());

  Logger logger = Logger();


  Future<AboutUsModel> getAboutUsData() async{
    try{
      var responseJson = await helper.get(NetworkConstants.ABOUT_US);
      if(responseJson.data !=null){
        return AboutUsModel.fromJson(responseJson.data);
      }
    }catch(e){
      logger.d(e);

    }throw{

    };
  }

  Future<SettingsModel> getTCPP() async{
    try{
      var responseJson = await helper.get(NetworkConstants.SETTINGS);
      if(responseJson.data !=null){
        return SettingsModel.fromJson(responseJson.data);
      }
    }catch(e){
      logger.d(e);

    }throw{

    };
  }




  Future<dynamic> postContactUsData(ContactUsModel request) async {
    var responseJson = await helper.post(
      NetworkConstants.CONTACT_US,
      request.toJson(),
    );
    var jsonsDataString = responseJson.data;
    var str = json.encode(jsonsDataString);
    print(str);
    var data=json.decode(str);
    if(data["success"]==false){
      return MessageResponse.fromJson(responseJson.data);
    }else{
      return ContactUsResponse.fromJson(responseJson.data);
    }

  }

  Future<dynamic> postLostandFoundData(LostAndFoundModel request) async {

    try{
      var responseJson = await helper.post(
        NetworkConstants.LOSTANDFOUND,
        request.toJson(),
      );
      var jsonsDataString = responseJson.data;
      var str = json.encode(jsonsDataString);
      print(str);
      var data=json.decode(str);
      if(data["success"]==false){
        return MessageResponse.fromJson(responseJson.data);
      }else{
        return LostAndFoundResponse.fromJson(responseJson.data);
      }

    }catch(e){
      logger.d(e);
      print(e);

    }

  }



  Future<FaqModel> getFaq() async{
    try{
      var responseJson = await helper.get(NetworkConstants.FAQ);
      if(responseJson.data !=null){
        return FaqModel.fromJson(responseJson.data);
      }
    }catch(e){
      logger.d(e);

    }throw{

    };
  }



}