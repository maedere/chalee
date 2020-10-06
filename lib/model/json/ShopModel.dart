// To parse this JSON data, do
//
//     final resopnsShop = resopnsShopFromJson(jsonString);

import 'dart:convert';

ResopnsShop resopnsShopFromJson(String str) => ResopnsShop.fromJson(json.decode(str));

String resopnsShopToJson(ResopnsShop data) => json.encode(data.toJson());

class ResopnsShop {
  ResopnsShop({
    this.result,
    this.shops,
  });

  String result;
  List<Shop> shops;

  factory ResopnsShop.fromJson(Map<String, dynamic> json) => ResopnsShop(
    result: json["result"],
    shops: List<Shop>.from(json["shops"].map((x) => Shop.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "shops": List<dynamic>.from(shops.map((x) => x.toJson())),
  };
}

class Shop {
  Shop({
    this.shopId,
    this.name,
    this.city,
    this.address,
    this.lat,
    this.lng,
    this.discount,
    this.activity,
    this.activityTime,
    this.rate,
    this.imageUrl,
    this.categoryId,
  });

  String shopId;
  String name;
  String city;
  String address;
  String lat;
  String lng;
  dynamic discount;
  String activity;
  String activityTime;
  String rate;
  String imageUrl;
  String categoryId;

  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
    shopId: json["shop_id"],
    name: json["name"],
    city: json["city"],
    address: json["address"],
    lat: json["lat"],
    lng: json["lng"],
    discount: json["discount"],
    activity: json["activity"],
    activityTime: json["activity_time"],
    rate: json["rate"],
    imageUrl: json["image_url"],
    categoryId: json["category_id"],
  );

  Map<String, dynamic> toJson() => {
    "shop_id": shopId,
    "name": name,
    "city": city,
    "address": address,
    "lat": lat,
    "lng": lng,
    "discount": discount,
    "activity": activity,
    "activity_time": activityTime,
    "rate": rate,
    "image_url": imageUrl,
    "category_id": categoryId,
  };
}

ShopRequestType shopRequestTypeFromJson(String str) => ShopRequestType.fromJson(json.decode(str));

String shopRequestTypeToJson(ShopRequestType data) => json.encode(data.toJson());

class ShopRequestType {
  ShopRequestType({
    this.username,
    this.password,
    this.categoryId,
    this.type,
    this.search,
    this.addressId,
    this.rangeId,
  });

  String username;
  String password;
  String categoryId;
  String type;
  String search;
  String addressId;
  int rangeId;

  factory ShopRequestType.fromJson(Map<String, dynamic> json) => ShopRequestType(
    username: json["username"],
    password: json["password"],
    categoryId: json["category_id"],
    type: json["type"],
    search: json["search"],
    addressId: json["address_id"],
    rangeId: json["range_id"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "password": password,
    "category_id": categoryId,
    "type": type,
    "search": search,
    "address_id": addressId,
    "range_id": rangeId,
  };
}
