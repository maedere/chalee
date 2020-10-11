import 'dart:convert';

import 'package:chalee/model/json/EditPass.dart';
import 'package:chalee/model/json/GetOrder.dart';
import 'package:chalee/model/json/Location.dart';
import 'package:chalee/model/json/ProductModel.dart';
import 'package:chalee/model/json/ShopModel.dart';
import 'package:chalee/model/json/User.dart';
import 'package:chalee/model/local/DetailProduct.dart';
import 'package:chalee/screens/EditPassword.dart';
import 'package:chalee/screens/SelectionActivity.dart';
import 'package:chalee/screens/VerificationActivity.dart';
import 'package:chalee/util/Constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

String url = "https://newreza.ir/chale/php/customer/";

//login //ok
Future<String> login(UserRegister userRegister,
    GlobalKey<ScaffoldState> globalKey) async {
  User driver;
  String str;
  print(userRegister.username);
  print(userRegister.password);
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  var response = http.post(
    url + "login.php",
    body: userRegisterToJson(userRegister),
  );
  response.then((value) {
    print(value.body);
    if (jsonDecode(value.body)["result"] == "ok") {
      str="ok";
      driver = userFromJson(value.body);
      prefs.setString("firstname",driver.firstName.toString());
      prefs.setString("lastName", driver.lastName.toString());
      prefs.setString("email", driver.mail.toString());
      prefs.setString("password", driver.password.toString());
      prefs.setString("username", driver.username.toString());
      prefs.setString("newpass", "");
      print(driver.lastName.toString());
      print(driver.firstName.toString());
      Constant.user = driver;

      Navigator.pushReplacement(globalKey.currentContext,
        MaterialPageRoute(builder: (context) => SelectionActivity(),),);
    } else if (jsonDecode(value.body)["result"] == "no_user") {
      str="ok";
      globalKey.currentState.showSnackBar(
          Constant.snak("user Not found , please sign up"));
    } else {
      str="ok";
      globalKey.currentState.showSnackBar(Constant.snak(" no verification"));
      //go to sms_verification
      Navigator.push(globalKey.currentContext, MaterialPageRoute(
        builder: (context) => VerificationActivity(mobile: userRegister.username,),),);
    }
  }).catchError((error) {
    globalKey.currentState.showSnackBar(Constant.snak(error.toString()));
  });

  return str;
}
void printWrapped(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));

}
//registry
Future<String> registry(UserRegister user,
    GlobalKey<ScaffoldState> globalKey) async {
  String result;

  var response = http.post(
    url + "registry.php",
    body: userRegisterToJson(user),
  );
  response.then((value) {
    result = jsonDecode(value.body)["result"];
  }).catchError((error) {
    return error;
  });
  return result;
}

//get_shops.php
Future<List<Shop>> getShopType(ShopRequestType shopRequestType,
    GlobalKey<ScaffoldState> globalKey) async {
  List<Shop> shops = [];

  var response = await http.post(
    url + "get_shops.php",
    body: shopRequestTypeToJson(shopRequestType),
  ).catchError((error) {
  globalKey.currentState.showSnackBar(Constant.snak(error.toString()));
  });

  ResopnsShop respnse = resopnsShopFromJson(response.body);
  if (respnse.result == "ok") {
    shops = respnse.shops;

  } else {
    //no shop
  }


  return shops;
}


//get_confirmation_code
Future<String> getCode(String user, GlobalKey<ScaffoldState> globalKey) async {
  Map<String, dynamic> jsonBody = {"username": user};

  var response = http.post(
    url + "get_confirmation_code.php",
    body: json.encode(jsonBody),
  );
  response.then((value) {
    String result = jsonDecode(value.body)["result"];
    switch (result) {
      case "ok":
        //todo
       // return
    }
  }).catchError((error) {
    globalKey.currentState.showSnackBar(Constant.snak(error.toString()));
  });
}

//post_confirmation_code.php
Future<void> sendCode(String user, String code,
    GlobalKey<ScaffoldState> globalKey) async {
  Map<String, dynamic> jsonBody = {"username": user, "code": code};

  var response = http.post(
    url + "post_confirmation_code.php",
    body: json.encode(jsonBody),
  );
  response.then((value) {
    //todo handle
  }).catchError((error) {
    return error;
  });
}

//get_goods.php
//todo

Future<DetailProductModel> getProducts(ShopProductRequest request,
    GlobalKey<ScaffoldState> globalKey) async {

  DetailProductModel model ;
  List<SubCategories> subCategories=[];
  List<ProductModel> productModels=[];

  var response = await http.post(
    url + "get_goods.php",
    body: shopProductRequestToJson(request),
  ).catchError((error) {
    print(error.toString());
    return error;
  });

  var result = jsonDecode(response.body);
  printWrapped(response.body);

  if(result["result"] == "ok"){
    //subCategories=subCategoriesListFromJson(result["subcategories"]);
    for(final i in result["subcategories"])
        subCategories.add(new SubCategories(i["id"],i["name"]));
      
    for(final i in result["goods"])
      productModels.add(new ProductModel(int.parse(i["availability"]), i["id"], i["spicy"], i["feed_Type"], i["calories"], double.parse(i["rate"]), i["image_url"], i["name"], i["subcategory_id"], double.parse(i["price"]), double.parse(i["discount"]), i["description"], int.parse(i["shop_id"]),0));
    //print(result["goods"]);
   // model = DetailProductModel(listSub: subCategoriesListFromJson(result["subcategories"]), products: productsFromJson(result["goods"]));
  }

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("address1",result["address"]);
  prefs.setString("lat", result["lat"]);
  prefs.setString("lng", result["lng"]);

  model=DetailProductModel(listSub: subCategories,products: productModels);
  return model;
}

//add_address.php
Future<void> addAddress(LocationModel request,
    GlobalKey<ScaffoldState> globalKey) async {
  var response = http.post(
    url + "add_address.php",
    body: json.encode(request),
  );
  response.then((value) {
    String result = jsonDecode(value.body)["result"];
    if(result == "ok"){
      //todo replacement 2 way: home , profile
    }
  }).catchError((error) {
    return error;
  });

}



Future<List<Orders>> getOrder(String username,String password,String rangeId,
    GlobalKey<ScaffoldState> globalKey) async {
  List <Orders> orders=[];

  Map<String , dynamic> map = {
    "username": username,
    "password": password,
    "range_id": rangeId
  };
  var response = await http.post(
    url + "get_orders.php",
    body: map,
  ).catchError((error) {
    print(error.toString()+"******************************");
    return orders;
  });


  var result = jsonDecode(response.body);
  if(result["result"] == "ok"){
    //subCategories=subCategoriesListFromJson(result["subcategories"]);
    for(final i in result["orders"])
    {
      List<Goods> goods=[];
      for(final j in i["goods"])
        goods.add(new Goods(j["id"],j["name"],j["image_url"],j["price"],j["discount"],j["count"]));
      orders.add(new Orders(i["id"],i["shop_id"],i["shop_name"],i["shop_image_url"],i["shop_accept_time"],i["total_payment"],i["time"],i["status"],goods));
    }
  }
  //print(result["goods"]);
  // model = DetailProductModel(listSub: subCategoriesListFromJson(result["subcategories"]), products: productsFromJson(result["goods"]));
  return orders;


}

<<<<<<< HEAD

Future editPass(String username,String password,String newpass,String firstname,String lastname,String mail,
    GlobalKey<ScaffoldState> globalKey) async {
  List <Orders> orders=[];

  Map<String , dynamic> map = {
    "username": username,
    "password": password,
    "new_password": newpass,
    "first_name": firstname,
    "last_name": lastname,
    "mail": mail
  };
  var response = await http.post(
    url + "edit_profile.php",
    body: map,
  ).catchError((error) {
    print(error.toString()+"******************************");
    return orders;
  });


  var result = jsonDecode(response.body);
  print(result["result"]+"jjjjjjjjjjjjj");

  //print(result["goods"]);
  // model = DetailProductModel(listSub: subCategoriesListFromJson(result["subcategories"]), products: productsFromJson(result["goods"]));
  //return orders;


}
/*
=======
>>>>>>> e07d8104591f89cbe2966013f5abd7a3c3a5a0ed

Future<Map> addOrder(String username,String password,String shop_id,
    String name,String phone,String mail,
    String company,String address,String lat,String lng,String vehicle_code,
    String description,String payment_method,List<SimpleGood> simplegoods,
    GlobalKey<ScaffoldState> globalKey) async {

  var goods = <Map<String, String>>[];
  for(final i in simplegoods)
    goods.add({"id":i.id,"name":i.name});

  var _body = <String, dynamic> {
    "username": username,
    "password": password,
    "shop_id": shop_id,
    "name": name,
    "phone": phone,
    "mail": mail,
    "company": company,
    "address": address,
    "lat": lat,
    "lng": lng,
    "vehicle_code": vehicle_code,
    "description": description,
    "payment_method": payment_method,
    "goods": goods ,

  };
  var bytes = utf8.encode(json.encode(_body));

  var response = await http.post(
    url + "add_order.php",
    body: bytes,
  ).catchError((error) {
    print(error.toString());
    return error;
  });

  var result = jsonDecode(response.body);
  printWrapped(response.body);

    Map<String , dynamic> returnvalue = {
      "result":result["result"],
      "time":result["time"],
    };




  return returnvalue;
}
