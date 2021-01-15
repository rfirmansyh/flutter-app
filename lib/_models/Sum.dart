import 'dart:convert';

Sum sumFromJson(String str) => Sum.fromJson(json.decode(str));

String sumToJson(Sum data) => json.encode(data.toJson());

class Sum {
    Sum({
        this.sum5,
        this.sum4,
        this.sum3,
        this.sum2,
        this.sum1,
    });

    String sum5;
    String sum4;
    String sum3;
    String sum2;
    String sum1;

    factory Sum.fromJson(Map<String, dynamic> json) => Sum(
        sum5: json["sum_5"] == null ? null : json["sum_5"],
        sum4: json["sum_4"] == null ? null : json["sum_4"],
        sum3: json["sum_3"] == null ? null : json["sum_3"],
        sum2: json["sum_2"] == null ? null : json["sum_2"],
        sum1: json["sum_1"] == null ? null : json["sum_1"],
    );

    Map<String, dynamic> toJson() => {
        "sum_5": sum5 == null ? null : sum5,
        "sum_4": sum4 == null ? null : sum4,
        "sum_3": sum3 == null ? null : sum3,
        "sum_2": sum2 == null ? null : sum2,
        "sum_1": sum1 == null ? null : sum1,
    };
}