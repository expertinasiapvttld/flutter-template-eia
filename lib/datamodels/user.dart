import 'dart:convert';

User userDataFromJson(String str) => User.fromJson(json.decode(str));

String userDataToJson(User? data) => json.encode(data?.toJson());

class User {
  final String? id;
  final String? userUid;
  final String? name;
  final String? userName;
  final String? email;

  User({
    this.id,
    this.userUid,
    this.name,
    this.userName,
    this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        userUid: json["userUid"],
        name: json["name"],
        userName: json["userName"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userUid": userUid,
        "name": name,
        "userName": userName,
        "email": email,
      };
}
