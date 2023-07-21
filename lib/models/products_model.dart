import 'dart:convert';

ProductResponseModel productModelFromJson(String str) =>
    ProductResponseModel.fromJson(json.decode(str));

String productModelToJson(ProductResponseModel data) =>
    json.encode(data.toJson());

class ProductResponseModel {
  List<ProductsModel> data;

  ProductResponseModel({
    required this.data,
  });

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) =>
      ProductResponseModel(
        data: List<ProductsModel>.from(
            json["data"].map((x) => ProductsModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ProductsModel {
  int id;
  String name;
  String image;
  String description;
  String price;
  int categoryId;
  int availability;
  DateTime createdAt;
  DateTime updatedAt;

  ProductsModel({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.categoryId,
    required this.availability,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        description: json["description"],
        price: json["price"],
        categoryId: json["category_id"],
        availability: json["availability"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "description": description,
        "price": price,
        "category_id": categoryId,
        "availability": availability,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
