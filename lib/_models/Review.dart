import 'dart:convert';

Review reviewFromJson(String str) => Review.fromJson(json.decode(str));

String reviewToJson(Review data) => json.encode(data.toJson());

class Review {
    Review({
        this.id,
        this.body,
        this.rating,
        this.createdAt,
        this.updatedAt,
        this.userId,
        this.tempatId,
        this.name,
        this.photo,
    });

    int id;
    String body;
    double rating;
    DateTime createdAt;
    DateTime updatedAt;
    int userId;
    int tempatId;
    String name;
    dynamic photo;

    factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["id"] == null ? null : json["id"],
        body: json["body"] == null ? null : json["body"],
        rating: json["rating"] == null ? null : json["rating"].toDouble(),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        userId: json["user_id"] == null ? null : json["user_id"],
        tempatId: json["tempat_id"] == null ? null : json["tempat_id"],
        name: json["name"] == null ? null : json["name"],
        photo: json["photo"] == null ? null : json["photo"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "body": body == null ? null : body,
        "rating": rating == null ? null : rating,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "user_id": userId == null ? null : userId,
        "tempat_id": tempatId == null ? null : tempatId,
        "name": name == null ? null : name,
        "photo": photo == null ? null : photo,
    };
}