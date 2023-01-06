import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:report_azvidi/app/utils/constants.dart';

import '../modules/main/main_controller.dart';

class AuthApi {
  final dio = Dio(BaseOptions(baseUrl: apiBaseUrl));

  Future loginRequest(email) async {
    try {
      final response = await dio.post(loginApi,
          data: {"email": email},
          options: Options(headers: {"Content-Type": "application/json"}));
      return response.data;
    } on DioError catch (e) {
      final response = e.response;
      if (response != null) {
        return response.data;
      } else {
        print(e.requestOptions);
        print(e.message);
      }
    }
  }

  Future refreshTokenRequest(refreshToken) async {
    try {
      final response = await dio.post(refreshTokenApi,
          data: {"refreshToken": refreshToken},
          options: Options(headers: {"Content-Type": "application/json"}));
      return response.data;
    } on DioError catch (e) {
      final response = e.response;
      if (response != null) {
        return response.data;
      } else {
        print(e.requestOptions);
        print(e.message);
      }
    }
  }

  Future verifyOtpRequest(otpId, otpCode) async {
    try {
      final response = await dio.post(verifyOtpApi,
          data: {"otpId": otpId, "code": otpCode},
          options: Options(headers: {"Content-Type": "application/json"}));
      return response.data;
    } on DioError catch (e) {
      final response = e.response;
      if (response != null) {
        return response.data;
      } else {
        print(e.requestOptions);
        print(e.message);
      }
    }
  }
}
