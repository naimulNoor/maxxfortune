import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../utils/constants.dart';
import 'package:dio/dio.dart';

class DioFactory {
  static final DioFactory _singleton = DioFactory._internal();
  Dio? _dio;

  factory DioFactory() {
    return _singleton;
  }

  DioFactory._internal() {
    this._dio = Dio();

    this._dio!.interceptors.add(
      // PrettyDioLogger(
      //   requestHeader: kDebugMode,
      //   requestBody: kDebugMode,
      //   responseBody: kDebugMode,
      //   responseHeader: kDebugMode,
      //   error: kDebugMode,
      // ),
      PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
        ),
    );
  }

  Dio getDio() => this._dio!;
}