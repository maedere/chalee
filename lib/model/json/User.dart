/*
// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.username,
    this.password,
    this.firstName,
    this.lastName,
    this.mail,
    this.wallet,
  });

  String username;
  String password;
  String firstName;
  String lastName;
  String mail;
  double wallet;

  factory User.fromJson(Map<String, dynamic> json) => User(
        username: json["username"],
        password: json["password"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        mail: json["mail"],
        wallet: double.parse(json["wallet"])
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "first_name": firstName,
        "last_name": lastName,
        "mail": mail,
      };
}

*/


import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.result,
    this.username,
    this.password,
    this.firstName,
    this.lastName,
    this.mail,
    this.wallet,
    this.addresses,
  });

  String result;
  String username;
  String password;
  String firstName;
  String lastName;
  String mail;
  String wallet;
  List<Address> addresses;

  factory User.fromJson(Map<String, dynamic> json) => User(
    result: json["result"],
    username: json["username"],
    password: json["password"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    mail: json["mail"],
    wallet: json["wallet"],
    addresses: List<Address>.from(json["addresses"].map((x) => Address.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "username": username,
    "password": password,
    "first_name": firstName,
    "last_name": lastName,
    "mail": mail,
    "wallet": wallet,
    "addresses": List<dynamic>.from(addresses.map((x) => x.toJson())),
  };
}

class Address {
  Address({
    this.id,
    this.address,
    this.lat,
    this.lng,
  });

  String id;
  String address;
  String lat;
  String lng;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    id: json["id"],
    address: json["address"],
    lat: json["lat"],
    lng: json["lng"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "address": address,
    "lat": lat,
    "lng": lng,
  };
}


String userRegisterToJson(UserRegister data) => json.encode(data.toJson());
//register User
class UserRegister {
  UserRegister({
    this.username,
    this.password,
  });

  String username;
  String password;

  Map<String, dynamic> toJson() => {
    "username": username,
    "password": password,
  };
}

