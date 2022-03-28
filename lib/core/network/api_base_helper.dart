import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:tokenapp/core/failure/exceptions/network_exception.dart';
import 'package:tokenapp/utils/shared_pref_utils.dart';

import '../../utils/constants.dart';
import 'dio_factory.dart';

class ApiBaseHelper {
  final DioFactory dioFactory;

  ApiBaseHelper({required this.dioFactory});

  Future<Response> get(String endUrl) async {
    await setToken();
    try {
      // make the network call
      final response =
          await dioFactory.getDio().get(NetworkConstants.BASE_URL + endUrl);
      //return the response
      return _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<Response> getDriver(String endUrl) async {
    await setDriverToken();
    try {
      // make the network call
      final response =
          await dioFactory.getDio().get(NetworkConstants.BASE_URL + endUrl);
      //return the response
      return _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<Response> getGeneralUser(String endUrl) async {
    await setGeneralUserToken();
    try {
      // make the network call
      final response =
          await dioFactory.getDio().get(NetworkConstants.BASE_URL + endUrl);
      //return the response
      return _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<Response> getWithParams(
      String endUrl, Map<String, dynamic> params) async {
    await setToken();
    try {
      // make the network call
      final response = await dioFactory
          .getDio()
          .get(NetworkConstants.BASE_URL + endUrl, queryParameters: params);
      //return the response
      return _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<Response> getRawWithParams(
      String url, Map<String, dynamic> params) async {
    try {
      // make the network call
      final response =
          await dioFactory.getDio().get(url, queryParameters: params);
      //return the response
      return _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<Response> postWithParams(
      String endUrl, Map<String, dynamic> params) async {
    await setToken();
    try {
      // make the network call
      final response = await dioFactory
          .getDio()
          .post(NetworkConstants.BASE_URL + endUrl, queryParameters: params);
      //return the response
      return _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<Response> post(String endUrl, Map<String, dynamic> body) async {
    await setToken();
    try {
      // make the network call
      final response = await dioFactory.getDio().post(
            NetworkConstants.BASE_URL + endUrl,
            data: body,
          );
      //return the response
      return _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<Response> postDriver(String endUrl, Map<String, dynamic> body) async {
    await setDriverToken();
    try {
      // make the network call
      final response = await dioFactory.getDio().post(
            NetworkConstants.BASE_URL + endUrl,
            data: body,
          );
      //return the response
      return _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<Response> postGeneralUser(
      String endUrl, Map<String, dynamic> body) async {
    await setGeneralUserToken();
    try {
      // make the network call
      final response = await dioFactory.getDio().post(
            NetworkConstants.BASE_URL + endUrl,
            data: body,
          );
      //return the response
      return _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<Response> postMultiPart(
      String endUrl, String key, File file, Map<String, dynamic> body) async {
    await setToken();

    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap(body);
    formData.files.add(MapEntry(
        key, await MultipartFile.fromFile(file.path, filename: fileName)));

    try {
      // make the network call
      final response = await dioFactory.getDio().post(
            NetworkConstants.BASE_URL + endUrl,
            data: formData,
          );

      return _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<Response> postGeneralUserMultiPart(String endUrl, File? userImage,
      File? careTakerImage, Map<String, dynamic> body) async {
    await setGeneralUserToken();
    FormData formData = FormData.fromMap(body);

    if (userImage != null) {
      String fileName = userImage.path.split('/').last;
      formData.files.add(
        MapEntry(
          "image",
          await MultipartFile.fromFile(
            userImage.path,
            filename: fileName,
          ),
        ),
      );
    }

    if (careTakerImage != null) {
      String fileName = careTakerImage.path.split('/').last;
      formData.files.add(
        MapEntry(
          "caretaker_image",
          await MultipartFile.fromFile(
            careTakerImage.path,
            filename: fileName,
          ),
        ),
      );
    }

    try {
      // make the network call
      final response = await dioFactory.getDio().post(
            NetworkConstants.BASE_URL + endUrl,
            data: formData,
          );

      return _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<void> setToken() async {
    var token = await SharedPrefUtil.getString(NetworkConstants.AUTHORIZATION);
    dioFactory.getDio().options = BaseOptions(headers: {
      NetworkConstants.ACCEPT: NetworkConstants.ACCEPT_TYPE,
      NetworkConstants.AUTHORIZATION: token,
    });
  }

  Future<void> setGeneralUserToken() async {
    var token =
        await SharedPrefUtil.getString(NetworkConstants.GENERAL_USER_TOKEN);
    dioFactory.getDio().options = BaseOptions(headers: {
      NetworkConstants.ACCEPT: NetworkConstants.ACCEPT_TYPE,
      NetworkConstants.AUTHORIZATION: token,
    });
  }

  Future<void> setDriverToken() async {
    var token = await SharedPrefUtil.getString(NetworkConstants.DRIVER_TOKEN);
    dioFactory.getDio().options = BaseOptions(headers: {
      NetworkConstants.ACCEPT: NetworkConstants.ACCEPT_TYPE,
      NetworkConstants.AUTHORIZATION: token,
    });
  }

  Future<Response> postPayNow(String endUrl, Map<String, dynamic> body) async {

    final userName = "test_66f99742202704902e1df68583408168";
    final password = "a0e1d3d9-28a8-4a6c-9c3e-ddd73ff5d40e";
    var auth = 'Basic '+base64Encode(utf8.encode('$userName:$password'));

    try {
      // make the network call
      final response = await dioFactory.getDio().post(
        endUrl,
        data: body,
        options: Options(headers:{
          'Authorization': auth,
          "Content-Type":" application/vnd.api+json"
        })
      );
      //return the response
      return _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

}

Response _returnResponse(Response response) {
  switch (response.statusCode) {
    case 200:
      return response;
    case 201:
      return response;
      break;
    case 400:
      throw BadRequestException(response.data.toString());
    case 401:
    case 403:
      var responseJson = response.data;
      throw UnauthorisedException(responseJson["message"].toString());
    case 500:
    default:
      throw FetchDataException('Error occurred while Communication with '
          'Server with StatusCode : ${response.statusCode}');
  }
}
