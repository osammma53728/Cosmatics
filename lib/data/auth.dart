import 'api.dart';

class AuthService {

  static Future login(String phone, String password , String countryCode ) async {

    final response = await ApiService.dio.post(
      "/api/Auth/login",
      data: {
        "countryCode": countryCode,
        "phoneNumber": phone,
        "password": password
        
      },
    );

    final token = response.data["token"];

    ApiService.setToken(token);

    return response.data;
  }
  
  static Future register(
    String username,
    String phone,
    String email,
    String password
) async {

  final response = await ApiService.dio.post(
    "/api/Auth/register",
    data: {
      "username": username,
      "countryCode": "+20",
      "phoneNumber": phone,
      "email": email,
      "password": password
    },
  );

  return response.data;

}

}
