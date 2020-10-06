import 'dart:convert';

import 'package:chalee/util/Constant.dart';

LocationModel locationModelFromJson(String str) => LocationModel.fromJson(json.decode(str));

String locationModelToJson(LocationModel data) => json.encode(data.toJson());

List<LocationModel> locationModelsFromJson(String str) => List<LocationModel>.from(json.decode(str).map((x) => LocationModel.fromJson(x)));

String locationModelsToJson(List<LocationModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LocationModel {
  LocationModel({
    this.address,
    this.lat,
    this.lng,
  });

  String address;
  double lat;
  double lng;

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
    address: json["address"],
    lat: json["lat"],
    lng: json["lng"],
  );

  Map<String, dynamic> toJson() => {
    "username" : Constant.user.username,
    "password" : Constant.user.password,
    "address": address,
    "lat": lat,
    "lng": lng,
  };
}
