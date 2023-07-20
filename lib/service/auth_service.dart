import 'package:dio/dio.dart';
import 'package:ecommerce_ui/models/user_model.dart';
import 'package:ecommerce_ui/service/endpoint.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationService {
  Future<UserResponseModel> login(String email, String password) async {
    final Dio dio = Dio();
    final GetStorage storage = GetStorage();

    final response = await dio.post(loginURL, data: {
      "email": email,
      "password": password,
    });

    if (response.statusCode != 200) {
      throw Exception('Failed to load data!');
    } else {
      final UserResponseModel loginResponseModel =
          UserResponseModel.fromJson(response.data);
      storage.write('token', loginResponseModel.token);
      return loginResponseModel;
    }
  }
}

final Provider<AuthenticationService> authenticationServiceProvider =
    Provider<AuthenticationService>(
  (ref) {
    return AuthenticationService();
  },
);
