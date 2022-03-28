import 'dart:convert';
import 'dart:io';

import 'package:tokenapp/core/network/api_base_helper.dart';
import 'package:tokenapp/core/network/dio_factory.dart';
import 'package:tokenapp/data/models/booking/booking_details_response.dart';
import 'package:tokenapp/data/models/booking/booking_request.dart';
import 'package:tokenapp/data/models/booking/booking_response.dart';
import 'package:tokenapp/data/models/booking/child_list_response.dart';
import 'package:tokenapp/data/models/booking/invoice_response.dart';
import 'package:tokenapp/data/models/booking/my_booking_list_response.dart';
import 'package:tokenapp/data/models/booking/pay_now_request.dart';
import 'package:tokenapp/data/models/booking/pay_now_response.dart';
import 'package:tokenapp/data/models/booking/pricing_response.dart';
import 'package:tokenapp/data/models/booking/rating_request.dart';
import 'package:tokenapp/data/models/booking/rating_response.dart';
import 'package:tokenapp/data/models/driver/child_list_response.dart';
import 'package:tokenapp/data/models/driver/child_list_update_response.dart';
import 'package:tokenapp/data/models/driver/driver_login_request.dart';
import 'package:tokenapp/data/models/driver/driver_login_response.dart';
import 'package:tokenapp/data/models/driver/driver_password_reset_code_response.dart';
import 'package:tokenapp/data/models/driver/driver_password_reset_request.dart';
import 'package:tokenapp/data/models/driver/driver_password_reset_response.dart';
import 'package:tokenapp/data/models/driver/driver_profile_response.dart';
import 'package:tokenapp/data/models/general_user/general_user_login_request.dart';
import 'package:tokenapp/data/models/general_user/general_user_login_response.dart';
import 'package:tokenapp/data/models/general_user/general_user_signup_request.dart';
import 'package:tokenapp/data/models/general_user/general_user_signup_response.dart';
import 'package:tokenapp/data/models/general_user/profile/general_user_profile_response.dart';
import 'package:tokenapp/data/models/general_user/profile/profile_update_request.dart';
import 'package:tokenapp/data/models/general_user/profile/profile_update_response.dart';
import 'package:tokenapp/data/models/google_map/geocoding_response.dart';
import 'package:tokenapp/data/models/one_map/one_map_response.dart';
import 'package:tokenapp/data/models/service_partner/auth/login/service_partner_login_request.dart';
import 'package:tokenapp/data/models/service_partner/auth/login/service_partner_login_response.dart';
import 'package:tokenapp/data/models/service_partner/auth/password_reset_code_request.dart';
import 'package:tokenapp/data/models/service_partner/auth/password_reset_request.dart';
import 'package:tokenapp/data/models/service_partner/auth/signup/service_partner_signup_request.dart';
import 'package:tokenapp/data/models/service_partner/auth/signup/service_partner_signup_response.dart';
import 'package:tokenapp/data/models/service_partner/profile/service_partner_profile_response.dart';
import 'package:tokenapp/data/models/service_partner/profile/service_partner_profile_update_request.dart';
import 'package:tokenapp/data/models/service_partner/profile/service_partner_profile_update_response.dart';
import 'package:tokenapp/data/models/service_partner/vehicle/sp_reset_vehicle_login_request.dart';
import 'package:tokenapp/data/models/service_partner/vehicle/sp_reset_veicle_login_response.dart';
import 'package:tokenapp/data/models/vehicles/add_vehicle_request.dart';
import 'package:tokenapp/data/models/vehicles/ass_vehicle_response.dart';
import 'package:tokenapp/data/models/vehicles/update_vehicle_details_request.dart';
import 'package:tokenapp/data/models/vehicles/update_vehicle_details_response.dart';
import 'package:tokenapp/data/models/vehicles/vehicle_list_response.dart';

import 'package:tokenapp/utils/constants.dart';
import 'package:tokenapp/utils/shared_pref_utils.dart';
import 'package:logger/logger.dart';

class Repository{

  final ApiBaseHelper helper = ApiBaseHelper(dioFactory: DioFactory());

  Logger logger = Logger();

  Future<ServicePartnerSignupResponse> signupServicePartner(
      ServicePartnerSignupRequest request,
      File image,
      ) async{
    try{
      var responseJson = await helper.postMultiPart(
        NetworkConstants.SERVICE_PARTNER_SIGNUP,
        KeyConstants.SERVICE_PROVIDER_IMAGE_KEY,
        image,
        request.toJson(),
      );
      if(responseJson.statusCode == 200){
        return ServicePartnerSignupResponse.fromJson(responseJson.data);
      }else{
        return ServicePartnerSignupResponse(
          success: false,
          msg: "Error from server"
        );
      }
    }catch(e){
      logger.d(e);
      return ServicePartnerSignupResponse(
          success: false,
          msg: "Data parsing error"
      );
    }
  }


  Future<ServicePartnerProfileResponse> getServicePartnerProfile() async{
    try{
      var responseJson = await helper.get(NetworkConstants.SERVICE_PARTNER_PROFILE);
      if(responseJson.data !=null){
        return ServicePartnerProfileResponse.fromJson(responseJson.data);
      }else{
        return ServicePartnerProfileResponse(
          message: "Error from server"
        );
      }
    }catch(e){
      logger.d(e);
      return ServicePartnerProfileResponse(
          message: "Data parsing error"
      );
    }
  }

  Future<bool> isLoggedIn() async{
    var token = await SharedPrefUtil.getString(NetworkConstants.AUTHORIZATION);
    return token.isNotEmpty;
  }

  Future<bool> isGeneralUserLoggedIn() async{
    var token = await SharedPrefUtil.getString(NetworkConstants.GENERAL_USER_TOKEN);
    return token.isNotEmpty;
  }

  Future<bool> isDriverLoggedIn() async{
    var token = await SharedPrefUtil.getString(NetworkConstants.DRIVER_TOKEN);
    return token.isNotEmpty;
  }

  Future<VehicleListResponse> getVehicleList() async{
    try{
      var response = await helper.get(NetworkConstants.VEHICLE_LIST);
      return VehicleListResponse.fromJson(response.data);
    }catch(e){
      return VehicleListResponse(
        data: null,
      );
    }
  }



  Future<AddVehicleResponse> addVehicle(AddVehicleRequest request, File image) async {
    try{
      var response = await helper.postMultiPart(
          NetworkConstants.ADD_VEHICLE,
          "image",
          image,
          request.toJson(),
      );
      if(response.statusCode==200){
        return AddVehicleResponse.fromJson(response.data);
      }else{
        return AddVehicleResponse(
          success: false,
        );
      }
    }catch(e){
      logger.d(e);
      return AddVehicleResponse(
        success: false,
      );
    }
  }

  Future<DriverProfileResponse> getDriverProfile() async{
    try{
      var response = await helper.getDriver(NetworkConstants.DRIVER_PROFILE);
      if(response.statusCode==200)
        return DriverProfileResponse.fromJson(response.data);
      else return DriverProfileResponse();
    }catch(e){
      logger.d(e);
      return DriverProfileResponse();
    }
  }

  Future logoutServicePartner() async{
    await SharedPrefUtil.delete(NetworkConstants.AUTHORIZATION);
  }
  Future logoutGeneralUser() async{
    await SharedPrefUtil.delete(NetworkConstants.GENERAL_USER_TOKEN);
    await SharedPrefUtil.delete(NetworkConstants.GENERAL_USER_PROFILE);
  }

  
  Future<ServicePartnerProfileUpdateResponse> updateServicePartnerProfile(
      ServicePartnerProfileUpdateRequest request,
      File? file,
      ) async{
    try{
      var response;

      if(file != null) {
        response = await helper.postMultiPart(
          NetworkConstants.SERVICE_PARTNER_PROFILE_UPDATE,
          "image",
          file,
          request.toJson(),
        );
      }else{
        response = await helper.post(
          NetworkConstants.SERVICE_PARTNER_PROFILE_UPDATE,
          request.toJson(),
        );
      }

      if(response.statusCode==200){
        return ServicePartnerProfileUpdateResponse.fromJson(
          response.data
        );
      }else{
        return ServicePartnerProfileUpdateResponse(
            success: false,
            msg: "Error from the Server"
        );
      }

    }catch(e){
      logger.d(e);
      return ServicePartnerProfileUpdateResponse(
          success: false,
          msg: "Data Parsing Error"
      );
    }
  }

  Future<SpResetVehicleLoginResponse> resetSPVehicleLogin(SpResetVehicleLoginRequest request) async{
    try{
      var response = await helper.post(
        NetworkConstants.SP_VEHICLE_RESET_PASSWORD,
        request.toJson(),
      );

      if(response.statusCode == 200){
        return SpResetVehicleLoginResponse.fromJson(response.data);
      }else{
        return SpResetVehicleLoginResponse(
          success: false,
          msg: "Server error",
        );
      }

    }catch(e){
      logger.d(e);
      return SpResetVehicleLoginResponse(
        success: false,
        msg: "Data Parsing Error",
      );
    }
  }

  Future<DriverPasswordResetCodeResponse> requestDriverPasswordResetCode() async{
    try{
      var response = await helper.postDriver(NetworkConstants.SEND_DRIVER_PASSWORD_RESET_CODE, {});
      return DriverPasswordResetCodeResponse.fromJson(response.data);
    }catch(e){
      logger.d(e);
      return DriverPasswordResetCodeResponse(
        success: false,
        msg: "Failed to send code"
      );
    }
  }

  Future<DriverPasswordResetResponse> resetDriverPassword(DriverPasswordResetRequest request) async{
    try{
      var response = await helper.postDriver(NetworkConstants.RESET_DRIVER_PASSWORD, request.toJson());
      return DriverPasswordResetResponse.fromJson(response.data);
    }catch(e){
      logger.d(e);
      return DriverPasswordResetResponse(
          success: false,
          msg: "Failed to reset Password"
      );
    }
  }

  Future<UpdateVehicleDetailsResponse> updateVehicleDetails(
      UpdateVehicleDetailsRequest request,
      File? file,
      ) async{
    try{
      var response;

      if(file != null) {
        response = await helper.postMultiPart(
          NetworkConstants.UPDATE_VEHICLE_DETAILS,
          "image",
          file,
          request.toJson(),
        );
      }else{
        response = await helper.post(
          NetworkConstants.UPDATE_VEHICLE_DETAILS,
          request.toJson(),
        );
      }

      if(response.statusCode==200){
        return UpdateVehicleDetailsResponse.fromJson(
            response.data
        );
      }else{
        return UpdateVehicleDetailsResponse(
            success: false,
            msg: "Error from the Server"
        );
      }

    }catch(e){
      logger.d(e);
      return UpdateVehicleDetailsResponse(
          success: false,
          msg: "Data Parsing Error"
      );
    }
  }

  Future<DriverPasswordResetCodeResponse> requestSPPasswordResetCode(
      PasswordResetCodeRequest request) async{

      try{
        var response = await helper.post(
          NetworkConstants.SEND_RESET_PASSWORD_CODE,
          request.toJson(),
        );
        return DriverPasswordResetCodeResponse.fromJson(response.data);
      }catch(e){
        return DriverPasswordResetCodeResponse(
            success: false,
            msg: "Failed to send code"
        );
      }

  }

  Future<DriverPasswordResetResponse> requestSPPasswordReset(
      PasswordResetRequest request) async{
    try{
      var response = await helper.post(
        NetworkConstants.RESET_SP_PASSWORD,
        request.toJson(),
      );
      return DriverPasswordResetResponse.fromJson(response.data);
    }catch(e){
      return DriverPasswordResetResponse(
          success: false,
          msg: "Failed to send code"
      );
    }

  }

  Future<GeoCodingResponse> getGeoCodingResponse(String postalCode) async{

    try{
      var params = {
        "components":"postal_code:$postalCode|country:SG", //
        "key":"AIzaSyBXu9gZE7h8rsOysVadX-XJ5WbvBwOKEqc",
      };
      var response = await helper.getRawWithParams(
          NetworkConstants.GET_ADDRESS_FROM_PO_CODE,
          params,
      );
      return GeoCodingResponse.fromJson(response.data);
    }catch(e){
      logger.d(e);
      return GeoCodingResponse(
        status: "No Result",
        results: [],
      );
    }

  }

  Future<GeoCodingResponse> getPostCodeFromAddress(String address) async{
    try{
      var params = {
        "address":"$address", //
        "key":"AIzaSyBXu9gZE7h8rsOysVadX-XJ5WbvBwOKEqc",
      };
      var response = await helper.getRawWithParams(
        NetworkConstants.GET_ADDRESS_FROM_PO_CODE,
        params,
      );
      return GeoCodingResponse.fromJson(response.data);
    }catch(e){
      logger.d(e);
      return GeoCodingResponse(
        status: "No Result",
        results: [],
      );
    }

  }



  Future<GeneralUserProfileResponse> getGeneralUserProfile() async{
    try{
      var response = await helper.getGeneralUser(
        NetworkConstants.GENERAL_USER_PROFILE,
      );
      return GeneralUserProfileResponse.fromJson(response.data);
    }catch(e){
      return GeneralUserProfileResponse(
          msg: "Failed to send code"
      );
    }
  }

  Future<DriverPasswordResetCodeResponse> requestGUPasswordResetCode(
      PasswordResetCodeRequest request) async{

    try{
      var response = await helper.postGeneralUser(
        NetworkConstants.GU_REQUEST_CODE,
        request.toJson(),
      );
      return DriverPasswordResetCodeResponse.fromJson(response.data);
    }catch(e){
      return DriverPasswordResetCodeResponse(
          success: false,
          msg: "Failed to send code"
      );
    }

  }

  Future<DriverPasswordResetResponse> requestGUPasswordReset(
      PasswordResetRequest request) async{
    try{
      var response = await helper.postGeneralUser(
        NetworkConstants.GU_RESET_PASSWORD,
        request.toJson(),
      );
      return DriverPasswordResetResponse.fromJson(response.data);
    }catch(e){
      return DriverPasswordResetResponse(
          success: false,
          msg: "Failed to send code"
      );
    }

  }

  Future<GeneralUserSignupResponse> signupGeneralUser(
      GeneralUserSignupRequest request) async {
    try {
      var responseJson = await helper.post(
          NetworkConstants.GENERAL_USER_SIGNUP, request.toJson());
      if (responseJson.statusCode == 200) {
        return GeneralUserSignupResponse.fromJson(responseJson.data);
      } else {
        return GeneralUserSignupResponse(success: false, msg: 'Error from server');
      }
    } catch (e) {
      logger.d(e);
      return GeneralUserSignupResponse(success: false, msg: 'Data Parsing Error');
    }
  }
  Future<UpdateProfileResponse> updateGeneralUserProfile(
      File? user,
      File? careTaker,
      UpdateProfileRequest request,
      ) async {
    try {

      var responseJson;

      responseJson = await helper.postGeneralUserMultiPart(
        NetworkConstants.GU_UPDATE_PROFILE,
        user,
        careTaker,
        request.toJson(),
      );

      if (responseJson.statusCode == 200) {
        return UpdateProfileResponse.fromJson(responseJson.data);
      } else {
        return UpdateProfileResponse(success:false, msg: 'Error from server');
      }
    } catch (e) {
      logger.d(e);
      return UpdateProfileResponse(success:false, msg: 'Data Parsing Error');
    }
  }

  Future<MyBookingListResponse> getMyBookingList() async{
    try{
      var response = await helper.getGeneralUser(
        NetworkConstants.MY_BOOKING_LIST,
      );
      return MyBookingListResponse.fromJson(response.data);
    }catch(e){
      logger.d(e);
      print(e.toString());
      return MyBookingListResponse(
          success: false
      );
    }
  }

  Future<BookingResponse> placeBooking(BookingRequest request) async {
    try {
      var responseJson = await helper.postGeneralUser(
          NetworkConstants.PLACE_BOOKING, request.toJson());
      if (responseJson.statusCode == 200) {
        return BookingResponse.fromJson(responseJson.data);
      } else {
        return BookingResponse(success: false, msg: 'Error from server');
      }
    } catch (e) {
      logger.d(e);
      return BookingResponse(success: false, msg: 'Booking added successfully');
    }
  }

  Future<RatingResponse> rateBooking(RatingRequest request) async{
    try {
      var responseJson = await helper.postGeneralUser(
          NetworkConstants.RATE_BOOKING, request.toJson());
      if (responseJson.statusCode == 200) {
        return RatingResponse.fromJson(responseJson.data);
      } else {
        return RatingResponse(success: false, msg: 'Error from server');
      }
    } catch (e) {
      logger.d(e);
      return RatingResponse(success: false, msg: 'Data Parsing Error');
    }
  }

  Future<ChildrenListResponse> getChildList() async{
    try {
      var responseJson = await helper.getGeneralUser(
          NetworkConstants.CHILD_LIST);
      if (responseJson.statusCode == 200) {
        return ChildrenListResponse.fromJson(responseJson.data);
      } else {
        return ChildrenListResponse(success: false, msg: 'Error from server');
      }
    } catch (e) {
      logger.d(e);
      return ChildrenListResponse(success: false, msg: 'Data Parsing Error');
    }
  }

  Future<OneMapResponse> getAddressFromCoordinates(String postalCode) async{
    try{

      var url = "https://developers.onemap.sg/commonapi/search";

      var response = await helper.getRawWithParams(
          url,
          {
            "searchVal":postalCode,
            "returnGeom":"Y",
            "getAddrDetails":"Y",
            "pageNum":1
          }
      );
      return OneMapResponse.fromJson(response.data);
    }catch(e){
      logger.d(e);
      return OneMapResponse(
        found: 0,
        totalNumPages: 0, pageNum: 0, results:[],
      );
    }
  }

  Future<PricingResponse> getPricing() async{
    try{
      var response = await helper.get(NetworkConstants.PRICING);
      return PricingResponse.fromJson(response.data);
    }catch(e){
      logger.d(e);
      return PricingResponse(success: false, data: []);
    }
  }

  Future<BookingDetailsResponse> getBookingDetails(int id) async{
    try{
      var response = await helper.getGeneralUser(NetworkConstants.BOOKING_DETAILS+"/$id");
      return BookingDetailsResponse.fromJson(response.data);
    }catch(e){
      logger.d(e);
      return BookingDetailsResponse(success: false);
    }
  }

  Future<PayNowResponse> makePaymentRequest(PayNowRequest request) async{
    try{
      var response = await helper.postPayNow(NetworkConstants.PAYMENT_REQUEST, request.toJson());
      logger.d(response.data);
      logger.d(response);
      return PayNowResponse.fromJson(jsonDecode(response.data.toString()));
    }catch(e){
      logger.d(e);
      return PayNowResponse();
    }
  }

  Future<InvoiceResponse> getInvoiceResponse(int id) async{
    try{
      var response = await helper.getGeneralUser(NetworkConstants.INVOICE_DETAILS+"/$id/invoice");
      return InvoiceResponse.fromJson(response.data);
    }catch(e){
      logger.d(e);
      return InvoiceResponse(success: false, msg: 'Booking added successfully');
    }
  }

  Future<ChildListResponse> getAllChildList() async{
    try{
      var response = await helper.getDriver(NetworkConstants.ALL_CHILD_LIST);
      return ChildListResponse.fromJson(response.data);
    }catch(e){
      logger.d(e);
      return ChildListResponse(success: false, msg: 'Failed to fetch child list', data: []);
    }
  }

  Future<ChildListUpdateResponse> updateChildList(int id) async{
    try{
      var requestBody = {
        "booking_travel_id":id
      };
      var response = await helper.postDriver(
          NetworkConstants.UPDATE_CHILD, requestBody);
      return ChildListUpdateResponse.fromJson(response.data);
    }catch(e){
      logger.d(e);
      return ChildListUpdateResponse(success: false,
          msg: 'Failed to update child list');
    }
  }
  
}