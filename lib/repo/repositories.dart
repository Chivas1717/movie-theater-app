import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:movie_theater_app/models/movie_model.dart';
import 'package:movie_theater_app/models/purchased_ticket_model.dart';
import 'package:movie_theater_app/models/session_model.dart';
import 'package:movie_theater_app/utils/secure_storage.dart';

import '../models/profile_model.dart';

class AuthRepository {
  String apiUrl = 'https://fs-mt.qwerty123.tech';

  Future<bool> requestOtp(String phoneNumber) async {
    var dio = Dio();
    String language = await SecureStorage.getLang();
    language = language.isEmpty ? 'en' : language;

    Response response = await dio.post(
      '$apiUrl/api/auth/otp',
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        'Accept-Language': language,
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
    String language = await SecureStorage.getLang();
    language = language.isEmpty ? 'en' : language;

    Response response = await dio.post(
      '$apiUrl/api/auth/login',
      data: {
        "phoneNumber": phoneNumber,
        "otp": "0000",
      },
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        'Accept-Language': language,
      }),
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
    var dio = Dio();
    String accessToken = await SecureStorage.getToken('token');
    String language = await SecureStorage.getLang();
    language = language.isEmpty ? 'en' : language;
    String date;
    String search;

    if (dateValue.isNotEmpty) {
      date = dateValue;
    } else {
      var formatter = DateFormat('yyyy-MM-dd');
      date = formatter.format(DateTime.now());
    }

    search = searchValue.isNotEmpty ? '&query=$searchValue' : '';

    Response response = await dio.get(
      '$apiUrl/api/movies?date=$date$search',
      options: Options(
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Accept-Language': language,
        },
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
    String language = await SecureStorage.getLang();
    language = language.isEmpty ? 'en' : language;
    String date;

    if (dateValue.isNotEmpty) {
      date = dateValue;
    } else {
      date = DateFormat('yyyy-MM-dd').format(DateTime.now());
    }

    String accessToken = await SecureStorage.getToken('token');
    // log(accessToken);
    // log(movieId);

    Response response = await dio.get(
      '$apiUrl/api/movies/sessions?movieId=$movieId&date=$date',
      options: Options(
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Accept-Language': language,
        },
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

class PaymentRepository {
  String apiUrl = 'https://fs-mt.qwerty123.tech';

  Future<bool> bookTickets(
    List<SelectedSeat> selectedSeats,
    int sessionId,
  ) async {
    var dio = Dio();

    String language = await SecureStorage.getLang();
    language = language.isEmpty ? 'en' : language;
    String accessToken = await SecureStorage.getToken('token');
    List<int> selectedSeatsIds = selectedSeats.map((e) => e.seat.id!).toList();

    Response response = await dio.post(
      '$apiUrl/api/movies/book',
      data: {
        'seats': selectedSeatsIds,
        'sessionId': sessionId,
      },
      options: Options(headers: {
        'Authorization': 'Bearer $accessToken',
        'Accept-Language': language,
      }),
    );

    if (response.statusCode == 200) {
      final bool result = response.data['success'];
      return result; // response.body;
    } else {
      throw Exception(response.statusMessage);
    }
  }

  Future<bool> buyTickets(
    List<SelectedSeat> selectedSeats,
    int sessionId,
    String email,
    String cardNumber,
    String expirationDate,
    String cvv,
  ) async {
    var dio = Dio();

    String language = await SecureStorage.getLang();
    language = language.isEmpty ? 'en' : language;
    String accessToken = await SecureStorage.getToken('token');
    List<int> selectedSeatsIds = selectedSeats.map((e) => e.seat.id!).toList();

    Response response = await dio.post(
      '$apiUrl/api/movies/buy',
      data: {
        "seats": selectedSeatsIds,
        "sessionId": sessionId,
        "email": email,
        "cardNumber": cardNumber,
        "expirationDate": expirationDate,
        "cvv": cvv,
      },
      options: Options(headers: {
        'Authorization': 'Bearer $accessToken',
        'Accept-Language': language,
      }),
    );

    if (response.statusCode == 200) {
      final bool result = response.data['success'];
      return result; // response.body;
    } else {
      throw Exception(response.statusMessage);
    }
  }
}

class ProfileRepository {
  String apiUrl = 'https://fs-mt.qwerty123.tech';

  Future<ProfileModel> getProfileInfo() async {
    var dio = Dio();

    String language = await SecureStorage.getLang();
    language = language.isEmpty ? 'en' : language;
    String accessToken = await SecureStorage.getToken('token');

    // log(accessToken);

    Response response = await dio.get(
      '$apiUrl/api/user',
      options: Options(headers: {
        'Authorization': 'Bearer $accessToken',
        'Accept-Language': language,
      }),
    );

    if (response.statusCode == 200) {
      final result = response.data['data'];
      return ProfileModel.fromJson(result);
    } else {
      throw Exception(response.statusMessage);
    }
  }

  Future<ProfileModel> updateProfileInfo(String newName) async {
    var dio = Dio();

    String language = await SecureStorage.getLang();
    language = language.isEmpty ? 'en' : language;
    String accessToken = await SecureStorage.getToken('token');

    Response response = await dio.post('$apiUrl/api/user',
        options: Options(headers: {
          "Authorization": 'Bearer $accessToken',
          'Accept-Language': language,
        }),
        data: {
          "name": newName,
        });

    if (response.statusCode == 200) {
      final result = response.data['data'];
      return ProfileModel.fromJson(result);
    } else {
      throw Exception(response.statusMessage);
    }
  }
}

class PurchasedTicketsRepository {
  String apiUrl = 'https://fs-mt.qwerty123.tech';

  Future<List<PurchasedTicketModel>> getPurchasedTickets() async {
    var dio = Dio();

    String language = await SecureStorage.getLang();
    language = language.isEmpty ? 'en' : language;
    String accessToken = await SecureStorage.getToken('token');

    Response response = await dio.get(
      '$apiUrl/api/user/tickets',
      options: Options(headers: {
        'Authorization': 'Bearer $accessToken',
        'Accept-Language': language,
      }),
    );

    if (response.statusCode == 200) {
      final List result = response.data['data'];
      return result.map((e) => PurchasedTicketModel.fromJson(e)).toList();
    } else {
      throw Exception(response.statusMessage);
    }
  }
}
