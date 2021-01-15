// To parse this JSON data, do
//
//     final tempat = tempatFromJson(jsonString);

import 'dart:convert';

class Tempat {
    Tempat({
        this.id,
        this.name,
        this.photo,
        this.description,
        this.ratingSanitasi,
        this.createdAt,
        this.updatedAt,
        this.userId,
        this.provinceId,
        this.kabupatenId,
        this.review,
        this.ratingReview,
        this.provinceName,
        this.kabupatenName,
        this.reviews,
    });

    int id;
    String name;
    dynamic photo;
    String description;
    double ratingSanitasi;
    DateTime createdAt;
    DateTime updatedAt;
    int userId;
    int provinceId;
    int kabupatenId;
    int review;
    double ratingReview;
    String provinceName;
    String kabupatenName;
    List<dynamic> reviews;

    Tempat copyWith({
        int id,
        String name,
        dynamic photo,
        String description,
        double ratingSanitasi,
        DateTime createdAt,
        DateTime updatedAt,
        int userId,
        int provinceId,
        int kabupatenId,
        int review,
        double ratingReview,
        String provinceName,
        String kabupatenName,
        List<dynamic> reviews,
    }) => 
        Tempat(
            id: id ?? this.id,
            name: name ?? this.name,
            photo: photo ?? this.photo,
            description: description ?? this.description,
            ratingSanitasi: ratingSanitasi ?? this.ratingSanitasi,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            userId: userId ?? this.userId,
            provinceId: provinceId ?? this.provinceId,
            kabupatenId: kabupatenId ?? this.kabupatenId,
            review: review ?? this.review,
            ratingReview: ratingReview ?? this.ratingReview,
            provinceName: provinceName ?? this.provinceName,
            kabupatenName: kabupatenName ?? this.kabupatenName,
            reviews: reviews ?? this.reviews,
        );

    factory Tempat.fromRawJson(String str) => Tempat.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Tempat.fromJson(Map<String, dynamic> json) => Tempat(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        photo: json["photo"],
        description: json["description"] == null ? null : json["description"],
        ratingSanitasi: json["rating_sanitasi"] == null ? null : json["rating_sanitasi"].toDouble(),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        userId: json["user_id"] == null ? null : json["user_id"],
        provinceId: json["province_id"] == null ? null : json["province_id"],
        kabupatenId: json["kabupaten_id"] == null ? null : json["kabupaten_id"],
        review: json["review"] == null ? null : json["review"],
        ratingReview: json["rating_review"] == null ? null : json["rating_review"].toDouble(),
        provinceName: json["province_name"] == null ? null : json["province_name"],
        kabupatenName: json["kabupaten_name"] == null ? null : json["kabupaten_name"],
        reviews: json["reviews"] == null ? null : List<dynamic>.from(json["reviews"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "photo": photo,
        "description": description == null ? null : description,
        "rating_sanitasi": ratingSanitasi == null ? null : ratingSanitasi,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "user_id": userId == null ? null : userId,
        "province_id": provinceId == null ? null : provinceId,
        "kabupaten_id": kabupatenId == null ? null : kabupatenId,
        "review": review == null ? null : review,
        "rating_review": ratingReview == null ? null : ratingReview,
        "province_name": provinceName == null ? null : provinceName,
        "kabupaten_name": kabupatenName == null ? null : kabupatenName,
        "reviews": reviews == null ? null : List<dynamic>.from(reviews.map((x) => x)),
    };
}
