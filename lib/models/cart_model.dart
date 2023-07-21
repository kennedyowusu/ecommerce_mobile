import 'dart:convert';

// convert the JSON string into a CartModel object
CartResponseModel cartModelFromJson(String str) =>
    CartResponseModel.fromJson(json.decode(str));

// convert a CartModel object back into a JSON string
String cartModelToJson(CartResponseModel data) => json.encode(data.toJson());

class CartResponseModel {
  List<CartModel> data;

  CartResponseModel({
    required this.data,
  });

  factory CartResponseModel.fromJson(Map<String, dynamic> json) =>
      CartResponseModel(
        data: List<CartModel>.from(
            json["data"].map((x) => CartModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CartModel {
  int id;
  int productId;
  int userId;
  int quantity;
  String totalPrice;
  int purchased;
  int removed;
  int cancelled;
  DateTime createdAt;
  DateTime updatedAt;

  CartModel({
    required this.id,
    required this.productId,
    required this.userId,
    required this.quantity,
    required this.totalPrice,
    required this.purchased,
    required this.removed,
    required this.cancelled,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json["id"],
        productId: json["product_id"],
        userId: json["user_id"],
        quantity: json["quantity"],
        totalPrice: json["total_price"],
        purchased: json["purchased"],
        removed: json["removed"],
        cancelled: json["cancelled"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "user_id": userId,
        "quantity": quantity,
        "total_price": totalPrice,
        "purchased": purchased,
        "removed": removed,
        "cancelled": cancelled,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
