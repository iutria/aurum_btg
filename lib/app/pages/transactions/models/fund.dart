import 'dart:convert';

class Fund {
  final int? id;
  final String? code;
  final String? displayName;
  final String? category;
  final int? price;

  Fund({
    this.id,
    this.code,
    this.displayName,
    this.category,
    this.price,
  });

  factory Fund.fromRawJson(String str) => Fund.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Fund.fromJson(Map<String, dynamic> json) => Fund(
    id: json["id"],
    code: json["code"],
    displayName: json["displayName"],
    category: json["category"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "displayName": displayName,
    "category": category,
    "price": price,
  };
}
