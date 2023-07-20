import 'package:dio/dio.dart';
import 'package:ecommerce_ui/models/user_model.dart';
import 'package:ecommerce_ui/service/endpoint.dart';
import 'package:ecommerce_ui/widgets/snackbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationService {
  final GetStorage storage = GetStorage();
  final Dio dio = Dio();

  Future<UserResponseModel> login(String email, String password) async {
    final response = await dio.post(loginURL, data: {
      "email": email,
      "password": password,
    });

    if (response.statusCode != 200) {
      final errorMessage = response.data['message'] as String;
      ToastWidget(message: errorMessage);
      throw Exception(errorMessage);
    } else {
      final UserResponseModel loginResponseModel =
          UserResponseModel.fromJson(response.data);
      storage.write('token', loginResponseModel.token);
      return loginResponseModel;
    }
  }

  Future<UserResponseModel> register(
      String name, String email, String password) async {
    final response = await dio.post(registerURL, data: {
      "name": name,
      "email": email,
      "password": password,
    });

    if (response.statusCode != 201) {
      final errorMessage = response.data['message'] as String;
      ToastWidget(message: errorMessage);
      throw Exception(errorMessage);
    } else {
      final UserResponseModel registerResponseModel =
          UserResponseModel.fromJson(response.data);
      storage.write('token', registerResponseModel.token);
      return registerResponseModel;
    }
  }
}

final Provider<AuthenticationService> authenticationServiceProvider =
    Provider<AuthenticationService>(
  (ref) {
    return AuthenticationService();
  },
);
