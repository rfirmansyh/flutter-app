import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
        this.id,
        this.name,
        this.photo,
        this.email,
        this.apiToken,
        this.createdAt,
        this.updatedAt,
        this.roleId,
        this.kabupatenId,
    });

    int id;
    String name;
    dynamic photo;
    String email;
    String apiToken;
    dynamic createdAt;
    DateTime updatedAt;
    int roleId;
    int kabupatenId;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        photo: json["photo"],
        email: json["email"] == null ? null : json["email"],
        apiToken: json["api_token"] == null ? null : json["api_token"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        roleId: json["role_id"] == null ? null : json["role_id"],
        kabupatenId: json["kabupaten_id"] == null ? null : json["kabupaten_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "photo": photo,
        "email": email == null ? null : email,
        "api_token": apiToken == null ? null : apiToken,
        "created_at": createdAt,
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "role_id": roleId == null ? null : roleId,
        "kabupaten_id": kabupatenId == null ? null : kabupatenId,
    };
}