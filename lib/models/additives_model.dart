// To parse this JSON data, do
//
//     final additive = additiveFromJson(jsonString);

import 'dart:convert';

Additive additiveFromJson(String str) => Additive.fromJson(json.decode(str));

String additiveToJson(Additive data) => json.encode(data.toJson());

class Additive {
    final int id;
    final String title;
    final String price;

    Additive({
        required this.id,
        required this.title,
        required this.price,
    });

    factory Additive.fromJson(Map<String, dynamic> json) => Additive(
        id: json["id"],
        title: json["title"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
    };
}
