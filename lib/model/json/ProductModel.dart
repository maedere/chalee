import 'dart:convert';

//ProductModel productFromJson(String str) => ProductModel.fromJson(json.decode(str));
//List<ProductModel> productsFromJson(String str) => List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromJson(x)));

String productToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
 /* ProductModel({
    this.available,
    this.id,
    this.spicy,
    this.feed_Type,
    this.calory,
    this.rate,
    this.image,
    this.name,
    this.categoryId,
    this.price,
    this.discount,
    this.description,
    this.shopId
  });*/

  ProductModel(
      this.available,
      this.id,
      this.spicy,
      this.feed_Type,
      this.calory,
      this.rate,
      this.image,
      this.name,
      this.categoryId,
      this.price,
      this.discount,
      this.description,
      this.shopId,
      this.count
      );

  ProductModel.send({
    this.username,
    this.password,
    this.name,
    this.categoryId,
    this.price,
    this.discount,
    this.count,
    this.description,
  });

  ProductModel.fake({
    this.image,
    this.count,
    this.username
  });

  int available;
  String id;
  String spicy;
  String feed_Type;
  String calory;
  double rate;
  String image;
  String name;
  String categoryId;
  double price;
  double discount;
  String description;
  int shopId;

  //request
  String username;
  String password;
  int count;

  /*factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    available: json["availability"],
    spicy: json["spicy"],
    rate: json["rate"],
    feed_Type: json["feed_type"],
    calory: json["calories"],
    image: json["image_url"],
    name: json["name"],
    id: json["id"],
    categoryId: json["subcategory_id"],
    price: json["price"].toDouble(),
    discount: json["discount"].toDouble(),
    description: json["description"],
      shopId : json["shop_id"]
  );*/

  Map<String, dynamic> toJson() => {
    "username": username,
    "password": password,
    "name": name,
    "category_id": categoryId,
    "price": price,
    "discount": discount,
    "count": count,
    "description": description,
  };
}

//SubCategories subCategoriesFromJson(String str) => SubCategories.fromJson(json.decode(str));
//List<SubCategories> subCategoriesListFromJson(String str) => List<SubCategories>.from(json.decode(str).map((x) => SubCategories.fromJson(x)));

class SubCategories {
  /*SubCategories({
    this.id,
    this.name,
  });*/


  SubCategories(this.id, this.name){
    this.id=id;
    this.name=name;
  }

  String id;
  String name;

 /* factory SubCategories.fromJson(Map<String, dynamic> json) => SubCategories(
    id: json["id"],
    name: json["name"],
  );*/
}


String shopProductRequestToJson(ShopProductRequest data) => json.encode(data.toJson());

class ShopProductRequest {
  ShopProductRequest({
    this.shopId,
    this.subcategoryId,
    this.rangeId,
  });

  String shopId;
  String subcategoryId;
  int rangeId;

  Map<String, dynamic> toJson() => {
    "shop_id": shopId,
    "subcategory_id": subcategoryId,
    "range_id": rangeId,
  };
}

