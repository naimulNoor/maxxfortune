import 'package:get/get.dart';
import 'package:tokenapp/data/models/booking/rating_request.dart';
import 'package:tokenapp/data/models/booking/rating_response.dart';
import 'package:tokenapp/data/repository/service_partner_repository.dart';

class FeedbackController extends GetxController{

  final Repository repository = Get.find();

  Future<RatingResponse> rateBooking(RatingRequest request) async{
    return await repository.rateBooking(request);
  }

}