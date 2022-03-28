import 'package:get/get.dart';
import 'package:tokenapp/data/repository/service_partner_repository.dart';

class ServiceProviderWelcomeController extends GetxController{

  final Repository repository = Get.find();

  Future<bool> isLoggedIn() async{
    return await repository.isLoggedIn();
  }
}