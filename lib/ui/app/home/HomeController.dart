import 'package:get/get.dart';
import 'package:tokenapp/data/models/container/AboutUsModel.dart';
import 'package:tokenapp/data/models/container/contactus/ContactUsModel.dart';
import 'package:tokenapp/data/models/container/contactus/ContactUsResponse.dart';
import 'package:tokenapp/data/models/service_partner/auth/login/service_partner_login_request.dart';
import 'package:tokenapp/data/models/service_partner/auth/login/service_partner_login_response.dart';
import 'package:tokenapp/data/repository/container_repository/ContainerRepository.dart';
import 'package:tokenapp/data/repository/service_partner_repository.dart';
import 'package:tokenapp/utils/constants.dart';
import 'package:tokenapp/utils/shared_pref_utils.dart';

class ContactUsController extends GetxController{

  final ContainerRepository repository = new ContainerRepository();

  Future<dynamic> ContactUsServiceProvider(ContactUsModel model) async{
    var response = await repository.postContactUsData(model);
    return response;
  }


}