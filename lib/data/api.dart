import 'package:dio/dio.dart';

class ApiService {

  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://cosmatics.growfet.com",
      headers: {
        "Content-Type": "application/json",
      },
    ),
  );

  static void setToken(String token) {
    dio.options.headers["Authorization"] = "Bearer $token";
  }

}