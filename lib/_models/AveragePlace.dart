import 'dart:convert';

AveragePlace averagePlaceFromJson(String str) => AveragePlace.fromJson(json.decode(str));

String averagePlaceToJson(AveragePlace data) => json.encode(data.toJson());

class AveragePlace {
    AveragePlace({
        this.id,
        this.name,
        this.averageRating,
        this.averageReview,
    });

    int id;
    String name;
    int averageRating;
    double averageReview;

    factory AveragePlace.fromJson(Map<String, dynamic> json) => AveragePlace(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        averageRating: json["average_rating"] == null ? null : json["average_rating"],
        averageReview: json["average_review"] == null ? null : json["average_review"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "average_rating": averageRating == null ? null : averageRating,
        "average_review": averageReview == null ? null : averageReview,
    };
}
