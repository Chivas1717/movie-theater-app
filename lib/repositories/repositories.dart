import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:movie_theater_app/models/movie_model.dart';
import 'package:movie_theater_app/models/session_model.dart';
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

class MoviesRepository {
  String apiUrl = 'https://fs-mt.qwerty123.tech';

  Future<List<MovieModel>> getMovies(searchValue, dateValue) async {
    log(searchValue);
    var dio = Dio();
    String date;
    String search;

    if (dateValue.isNotEmpty) {
      date = dateValue;
    } else {
      var formatter = DateFormat('yyyy-MM-dd');
      date = formatter.format(DateTime.now());
    }

    search = searchValue.isNotEmpty ? '&query=$searchValue' : '';

    String accessToken = await SecureStorage.getToken('token');

    Response response = await dio.get(
      '$apiUrl/api/movies?date=$date$search',
      options: Options(
        headers: {'Authorization': 'Bearer $accessToken'},
      ),
    );

    if (response.statusCode == 200) {
      final List result = response.data['data'];
      return result.map((e) => MovieModel.fromJson(e)).toList();
    } else {
      throw Exception(response.statusMessage);
    }
  }
}

class SessionsRepository {
  String apiUrl = 'https://fs-mt.qwerty123.tech';

  Future<List<SessionModel>> getSessions(movieId, dateValue) async {
    var dio = Dio();
    String date;

    if (dateValue.isNotEmpty) {
      date = dateValue;
    } else {
      date = DateFormat('yyyy-MM-dd').format(DateTime.now());
    }

    String accessToken = await SecureStorage.getToken('token');

    Response response = await dio.get(
      '$apiUrl/api/movies/sessions?movieId=$movieId&date=$date',
      options: Options(
        headers: {'Authorization': 'Bearer $accessToken'},
      ),
    );

    if (response.statusCode == 200) {
      final List result = response.data['data'];
      return result.map((e) => SessionModel.fromJson(e)).toList();
    } else {
      throw Exception(response.statusMessage);
    }
  }
}
