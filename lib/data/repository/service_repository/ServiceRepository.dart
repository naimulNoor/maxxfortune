import 'package:tokenapp/core/network/api_base_helper.dart';
import 'package:tokenapp/core/network/dio_factory.dart';
import 'package:tokenapp/data/models/service/ServiceModel.dart';
import 'package:tokenapp/utils/constants.dart';
import 'package:logger/logger.dart';

class ServiceRepository{

  final ApiBaseHelper helper = ApiBaseHelper(dioFactory: DioFactory());

  Logger logger = Logger();


  Future<ServiceModel> getServiceData() async{
    try{
      var responseJson = await helper.get(NetworkConstants.OURSERVICE);
      if(responseJson.data !=null){
        return ServiceModel.fromJson(responseJson.data);
      }
    }catch(e){
      logger.d(e);

    }throw{

    };
  }

}