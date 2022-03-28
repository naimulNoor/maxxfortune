import 'package:get/get.dart';
import 'package:tokenapp/data/repository/service_partner_repository.dart';

class NavigationContainerController extends GetxController{

  final Repository repository = Get.find();

  Future logoutServiceProvider() async{
    await repository.logoutServicePartner();
  }

}