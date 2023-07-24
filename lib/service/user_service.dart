import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecommerce_ui/models/user_model.dart';
import 'package:ecommerce_ui/service/endpoint.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

class UserService {
  final GetStorage box = GetStorage();
  final Dio dio = Dio();

  Future<UserResponseModel> fetchUserData(int userId) async {
    final String? token = box.read('token');

    final Response response = await dio.get(
      "$userURL/$userId",
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic>? responseData = response.data;
      if (responseData == null) {
        throw Exception("Response data is null.");
      }

      final Map<String, dynamic>? userData = responseData['data'];
      if (userData == null) {
        throw Exception("User data not available in the response.");
      }

      if (!userData.containsKey('name') ||
          !userData.containsKey('email') ||
          !userData.containsKey('role')) {
        throw Exception("Required user data keys are missing in the response.");
      }

      box.write("userData", userData);
      return userFromJson(json.encode(userData));
    } else {
      final dynamic responseData = response.data;
      if (responseData != null && responseData['message'] != null) {
        final String errorMessage = responseData['message'];
        throw Exception(errorMessage);
      } else {
        throw Exception("An unknown error occurred.");
      }
    }
  }
}

final Provider<UserService> userServiceProvider = Provider<UserService>((ref) {
  return UserService();
});
