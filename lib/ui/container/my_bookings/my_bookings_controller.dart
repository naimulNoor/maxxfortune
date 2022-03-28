import 'package:get/get.dart';
import 'package:tokenapp/data/models/booking/my_booking_list_response.dart';
import 'package:tokenapp/data/repository/service_partner_repository.dart';

class MyBookingsController extends GetxController{

  final Repository repository = Get.find();
  var bookingListResponse = Rx<MyBookingListResponse?>(null);

  getMyBookingList() async{
    var response = await repository.getMyBookingList();
    bookingListResponse.value = response;
  }


}