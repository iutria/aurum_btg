import 'dart:convert';

class User {
  final int? id;
  final String? name;
  final String? lastName;
  final String? username;
  final String? completeName;
  late int? amount;
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

  User copyWith({
    int? id,
    String? name,
    String? lastName,
    String? username,
    String? completeName,
    int? amount,
    String? email,
    String? photo,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      username: username ?? this.username,
      completeName: completeName ?? this.completeName,
      amount: amount ?? this.amount,
      email: email ?? this.email,
      photo: photo ?? this.photo,
    );
  }

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
