import 'package:get/get.dart';
import 'package:tokenapp/data/models/driver/child_list_response.dart';
import 'package:tokenapp/data/repository/service_partner_repository.dart';

class NotificationController extends GetxController{

  final Repository repository = Get.find();

  final allChildListResponse = Rx<ChildListResponse?>(null);

  getAllChildList() async{
    var response = repository.getAllChildList();
    allChildListResponse.value = await response;
  }

  updateChild(int id) async{
    await repository.updateChildList(id);
    await getAllChildList();
  }

}