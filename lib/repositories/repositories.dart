import 'dart:io';

import 'package:dio/dio.dart';
import 'package:movie_theater_app/utils/secure_storage.dart';

class AuthRepository {
  String apiUrl = 'https://fs-mt.qwerty123.tech';

  Future<bool> requestOtp(String phoneNumber) async {
    var dio = Dio();
    Response response = await dio.post(
      '$apiUrl/api/auth/otp',
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      }),
      data: {
        "phoneNumber": phoneNumber,
      },
    );

    if (response.statusCode == 200) {
      final bool result = response.data['success'];
      return result; // response.body;
    } else {
      throw Exception(response.statusMessage);
    }
  }

  Future<String> getAcessToken(phoneNumber, otp) async {
    var dio = Dio();

    Response response = await dio.post(
      '$apiUrl/api/auth/login',
      data: {
        "phoneNumber": phoneNumber,
        "otp": "0000",
      },
    );

    if (response.statusCode == 200) {
      final String accessToken = response.data['data']['accessToken'];
      SecureStorage.setToken(accessToken);
      return accessToken;
    } else {
      throw Exception(response.statusMessage);
    }
  }
}
