import 'dart:convert';

UserResponseModel userFromJson(String str) =>
    UserResponseModel.fromJson(json.decode(str));

String userToJson(UserResponseModel data) => json.encode(data.toJson());

class UserResponseModel {
  String message;
  UserModel user;
  String token;

  UserResponseModel({
    required this.message,
    required this.user,
    required this.token,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      UserResponseModel(
        message: json["message"],
        user: UserModel.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "user": user.toJson(),
        "token": token,
      };
}

class UserModel {
  String name;
  String email;
  String role;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  UserModel({
    required this.name,
    required this.email,
    required this.role,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        email: json["email"],
        role: json["role"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "role": role,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}
