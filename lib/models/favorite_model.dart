import 'dart:convert';

FavoriteResponseModel favoriteModelFromJson(String str) =>
    FavoriteResponseModel.fromJson(json.decode(str));

String favoriteModelToJson(FavoriteResponseModel data) =>
    json.encode(data.toJson());

class FavoriteResponseModel {
  List<FavoriteModel> data;

  FavoriteResponseModel({
    required this.data,
  });

  factory FavoriteResponseModel.fromJson(Map<String, dynamic> json) =>
      FavoriteResponseModel(
        data: List<FavoriteModel>.from(
          json["data"].map(
            (x) => FavoriteModel.fromJson(x),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(
          data.map(
            (x) => x.toJson(),
          ),
        ),
      };
}

class FavoriteModel {
  int id;
  String productId;
  String userId;

  FavoriteModel({
    required this.id,
    required this.productId,
    required this.userId,
  });

  factory FavoriteModel.fromJson(Map<String, dynamic> json) => FavoriteModel(
        id: json["id"],
        productId: json["product_id"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "user_id": userId,
      };
}
