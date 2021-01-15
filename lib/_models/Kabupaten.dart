
class Kabupaten {
    Kabupaten({
        this.id,
        this.name,
        this.provinceId,
    });

    int id;
    String name;
    int provinceId;

    factory Kabupaten.fromJson(Map<String, dynamic> json) => Kabupaten(
        id: json["id"],
        name: json["name"],
        provinceId: json["province_id"],
    );

    static List<Kabupaten> fromJsonList(List list) {
      if (list == null) return null;
      return list.map((item) => Kabupaten.fromJson(item)).toList();
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "province_id": provinceId,
    };

    @override
    String toString() => name;
}