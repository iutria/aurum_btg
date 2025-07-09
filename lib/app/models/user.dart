import 'dart:convert';

class User {
  final int? id;
  final String? name;
  final String? lastName;
  final String? username;
  final String? completeName;
  final int? amount;
  final String? email;
  final String? photo;

  User({
    this.id,
    this.name,
    this.lastName,
    this.username,
    this.completeName,
    this.amount,
    this.email,
    this.photo,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    lastName: json["last_name"],
    username: json["username"],
    completeName: json["complete_name"],
    amount: json["amount"],
    email: json["email"],
    photo: json["photo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "last_name": lastName,
    "username": username,
    "complete_name": completeName,
    "amount": amount,
    "email": email,
    "photo": photo,
  };
}
