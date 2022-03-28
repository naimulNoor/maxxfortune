import 'package:get/get.dart';
import 'package:tokenapp/data/models/service_partner/vehicle/sp_reset_vehicle_login_request.dart';
import 'package:tokenapp/data/models/service_partner/vehicle/sp_reset_veicle_login_response.dart';
import 'package:tokenapp/data/models/vehicles/vehicle_list_response.dart';
import 'package:tokenapp/data/repository/service_partner_repository.dart';

class ServiceProviderResetVehicleController extends GetxController{
  final Repository repository = Get.find();

  var vehicleListResponse = Rx<VehicleListResponse?>(null);

  getVehicleList() async{
    var response = await repository.getVehicleList();
    vehicleListResponse.value = response;
  }

  Future<SpResetVehicleLoginResponse> resetVehicleLogin(SpResetVehicleLoginRequest request) async{
    var response = await repository.resetSPVehicleLogin(request);
    return response;
  }

}