
class UserFund {
  final String? id;
  final String? code;
  final String? displayName;
  final String? category;
  final int? price;
  late bool? status;
  final DateTime? subscriptionDate;
  final DateTime? cancellationDate;
  final String? notificationType;

  UserFund({
    this.id,
    this.code,
    this.displayName,
    this.category,
    this.price,
    this.status,
    this.subscriptionDate,
    this.cancellationDate,
    this.notificationType,
  });

  factory UserFund.fromJson(Map<String, dynamic> json) => UserFund(
    id: json["id"],
    code: json["code"],
    displayName: json["displayName"],
    category: json["category"],
    price: json["price"],
    status: json["status"],
    subscriptionDate: DateTime.parse(json["subscriptionDate"]),
    cancellationDate: DateTime.parse(json["cancellationDate"]),
    notificationType: json["notificationType"],
  );

  factory UserFund.fromFund(Map<String, dynamic> json, notificationType, date) => UserFund(
    id: json["id"],
    code: json["code"],
    displayName: json["displayName"],
    category: json["category"],
    price: json["price"],
    status: true,
    subscriptionDate: date,
    cancellationDate: date,
    notificationType: notificationType,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "displayName": displayName,
    "category": category,
    "price": price,
    "status": status,
    "subscriptionDate": subscriptionDate.toString(),
    "cancellationDate": cancellationDate.toString(),
    "notificationType": notificationType,
  };
}
