import 'package:get/get.dart';
import 'package:tokenapp/data/models/one_map/one_map_response.dart';
import 'package:tokenapp/data/repository/service_partner_repository.dart';
import 'package:logger/logger.dart';

class SearchController extends GetxController{

  final Repository repository = Get.find();
  final logger = Logger();
  var searchResponse = Rx<OneMapResponse?>(null);

  searchAddress(String postalCode) async{
    var response = await repository.getAddressFromCoordinates(postalCode);
    logger.d(response.found);
    searchResponse.value = response;
  }
}