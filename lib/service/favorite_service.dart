import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ecommerce_ui/models/favorite_model.dart';
import 'package:ecommerce_ui/service/endpoint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

class FavoriteService {
  final GetStorage storage = GetStorage();
  final Dio dio = Dio();

  Future<FavoriteResponseModel> getFavoriteList() async {
    final String token = storage.read('token');
    final int userId = storage.read('userId');

    final Response response = await dio.get(
      favoriteUrl,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
      queryParameters: {
        'user_id': userId,
      },
    );

    try {
      if (response.statusCode != 200) {
        final String errorMessage = response.data['message'];
        debugPrint(errorMessage);
        throw Exception(errorMessage);
      } else {
        return favoriteModelFromJson(json.encode(response.data));
      }
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  // Future<void> addToFavorite(){

  // }
}

final Provider<FavoriteService> favoriteServiceProvider =
    Provider<FavoriteService>((ref) => FavoriteService());
