import 'package:get/get.dart';
import 'package:tokenapp/data/models/vehicles/vehicle_list_response.dart';
import 'package:tokenapp/data/repository/service_partner_repository.dart';

class ServiceProviderVehicleListController extends GetxController{

  final Repository repository = Get.find();

  var vehicleListResponse = Rx<VehicleListResponse?>(null);

  getVehicleList() async{
    vehicleListResponse.value = null;
    var response = await repository.getVehicleList();
    vehicleListResponse.value = response;
  }


}