import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:chalee/model/json/EditPass.dart';
import 'package:chalee/model/json/GetOrder.dart';
import 'package:chalee/model/json/Location.dart';
import 'package:chalee/model/json/ProductModel.dart';
import 'package:chalee/model/json/ShopComment.dart';
import 'package:chalee/model/json/ShopModel.dart';
import 'package:chalee/model/json/User.dart';
import 'package:chalee/model/local/DetailProduct.dart';
import 'package:chalee/screens/EditPassword.dart';
import 'package:chalee/screens/Profile.dart';
import 'package:chalee/screens/SelectionActivity.dart';
import 'package:chalee/screens/VerificationActivity.dart';
import 'package:chalee/util/Constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

String url = "https://newreza.ir/chale/php/customer/";
User driver;

//login //ok
Future<String> login(UserRegister userRegister,
    GlobalKey<ScaffoldState> globalKey) async {
  String str;
  print(userRegister.username);
  print(userRegister.password);
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  var response = await http.post(
    url + "login.php",
    body: userRegisterToJson(userRegister),
  ).catchError((error){
    print(error.toString());
    globalKey.currentState.showSnackBar(Constant.snak(error.toString()));
    return(error.toString());

  });

    print(response.body);
    if (jsonDecode(response.body)["result"] == "ok") {
      str="ok";

      driver = userFromJson(response.body);
      prefs.setString("firstname",driver.firstName.toString());
      prefs.setString("lastName", driver.lastName.toString());
      prefs.setString("email", driver.mail.toString());
      prefs.setString("password", driver.password.toString());
      prefs.setString("username", driver.username.toString());
      prefs.setString("wallet", driver.wallet.toString());
      Constant.user = driver;

      Navigator.pushReplacement(globalKey.currentContext,
        MaterialPageRoute(builder: (context) => SelectionActivity(),),);
    } else if (jsonDecode(response.body)["result"] == "no_user") {
      str="ok";
      globalKey.currentState.showSnackBar(
          Constant.snak("user Not found , please sign up"));
    } else {
      str="ok";
      globalKey.currentState.showSnackBar(Constant.snak(" no verification"));
      //go to sms_verification
      Navigator.push(globalKey.currentContext, MaterialPageRoute(
        builder: (context) => VerificationActivity(mobile: userRegister.username,
          password: userRegister.password,),),);
    }
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
Future<String> getCode(String user,String password, GlobalKey<ScaffoldState> globalKey) async {
  Map<String, dynamic> jsonBody =
  {"username": user,
    "password":password
  };

  var response = http.post(
    url + "get_confirmation_code.php",
    body: json.encode(jsonBody),
  );
  response.then((value) {
    String result = jsonDecode(value.body)["result"];
    print(value.body);
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
      productModels.add(new ProductModel(int.parse(i["availability"]), i["id"], i["spicy"], i["feed_Type"], i["calories"], double.parse(i["rate"]), i["image_url"], i["name"], i["subcategory_id"], double.parse(i["price"]), double.parse(i["discount"]), i["description"], int.parse(i["shop_id"]),0,false));
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
Future<void> deleteAddress(String username,
    String password,String addressId,GlobalKey<ScaffoldState> globalKey) async {

  var _body = <String, dynamic> {
    "username": username,
    "password": password,
    "address_id": addressId
  };
  var bytes = utf8.encode(json.encode(_body));

  var response = await http.post(
    url + "delete_address.php",
    body: bytes,
  ).catchError((error) {
    print(error.toString());
    globalKey.currentState.showSnackBar(
        Constant.snak(error.toString()));
    return error;
  });
  var result = jsonDecode(response.body);

  print(result);
    if(result["result"] == "ok"){
      //todo replacement 2 way: home , profile
    }else  globalKey.currentState.showSnackBar(
        Constant.snak("user Not found "));

}
Future<void> editAddress(LocationModel request,String username,
    String password,String addressId,GlobalKey<ScaffoldState> globalKey) async {

  var _body = <String, dynamic> {
    "username": username,
    "password": password,
    "address_id": addressId,
    "address": request.address,
    "lat": request.lat,
    "lng": request.lng
  };
  var bytes = utf8.encode(json.encode(_body));

  var response = await http.post(
    url + "edit_address.php",
    body: bytes,
  ).catchError((error) {
    print(error.toString());
    globalKey.currentState.showSnackBar(
        Constant.snak(error.toString()));
    return error;
  });
  var result = jsonDecode(response.body);

  print(result);
  if(result["result"] == "ok"){
    //todo replacement 2 way: home , profile
  }else  globalKey.currentState.showSnackBar(
      Constant.snak("user Not found "));

}
Future<void> addAddress(LocationModel request,String username,
    String password,GlobalKey<ScaffoldState> globalKey) async {

  var _body = <String, dynamic> {
    "username": username,
    "password": password,
    "address": request.address,
    "lat": request.lat,
    "lng": request.lng,
  };
  var bytes = utf8.encode(json.encode(_body));

  var response = await http.post(
    url + "add_address.php",
    body: bytes,
  ).catchError((error) {
    print(error.toString());
    globalKey.currentState.showSnackBar(
        Constant.snak(error.toString()));
    return error;
  });
  var result = jsonDecode(response.body);

  print(result);
  if(result["result"] == "ok"){
    //todo replacement 2 way: home , profile
  }else  globalKey.currentState.showSnackBar(
      Constant.snak("user Not found "));


}
Future<List<Address>> getAddresses(String userName, String password,
    GlobalKey<ScaffoldState> globalKey) async {

  List<Address> addresses=[];
  print(userName);
  print(password);
  var _body = <String, dynamic> {
      "username": userName,
      "password": password

  };
  var bytes = utf8.encode(json.encode(_body));

  var response = await http.post(
    url + "get_addresses.php",
    body: bytes,
  ).catchError((error) {
    print(error.toString());
    return error;
  });

  var result = jsonDecode(response.body);
  printWrapped(response.body);
  if(result["result"]=="ok")
  {
    for(final i in result["addresses"])
      addresses.add(new Address(i["id"],i["address"],i["lat"],i["lng"]));
  }

  return addresses;

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
    print(error.toString());
    return orders;
  });


  var result = jsonDecode(response.body);
  printWrapped(response.body);

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







Future<Map> addOrder(String username,String password,String shop_id,
    String name,String phone,String mail,
    String company,String address,String lat,String lng,String vehicle_code,
    String description,String payment_method,List<SimpleGood> simplegoods,
    GlobalKey<ScaffoldState> globalKey) async {

  var goods = <Map<String, String>>[];
  for(final i in simplegoods)
    goods.add({"id":i.id,"count":i.count.toString()});

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

Future<List<Shop_Good_Comment>> getGoodComment(String shop_id,String range_id,
    GlobalKey<ScaffoldState> globalKey) async {

  List<Shop_Good_Comment> goodComments=[];
  var _body = <String, dynamic> {
    "good_id": shop_id,
    "range_id": range_id,
  };
  var bytes = utf8.encode(json.encode(_body));

  var response = await http.post(
    url + "get_good_comments.php",
    body: bytes,
  ).catchError((error) {
    print(error.toString());
    return error;
  });


  var result = jsonDecode(response.body);
  printWrapped(response.body);
  if(result["result"]=="ok")
  {
    for(final i in result["comments"])
      goodComments.add(new Shop_Good_Comment(i["id"], i["good_id"], i["commenter_id"],
          i["commenter_name"], i["comment"], i["time"],i["rate"].toString()));
  }

  return goodComments;

}


Future<String> postGoodComment(String username,String password,String good_id,
    String comment,double rate, GlobalKey<ScaffoldState> globalKey) async {


  var _body = <String, dynamic> {
    "username": username,
    "password": password,
    "good_id": good_id,
    "comment" : comment,
    "rate": rate
  };
  var bytes = utf8.encode(json.encode(_body));

  var response = await http.post(
    url + "post_good_comment.php",
    body: bytes,
  ).catchError((error) {
    print(error.toString());
    return error;
  });

  var result = jsonDecode(response.body);
  printWrapped(response.body);
  return(result["result"]);


}

Future<List<Shop_Good_Comment>> getShopComment(String shop_id,String range_id, GlobalKey<ScaffoldState> globalKey) async {

  List<Shop_Good_Comment> shopComments=[];
  var _body = <String, dynamic> {
    "shop_id": shop_id,
    "range_id": range_id,
  };
  var bytes = utf8.encode(json.encode(_body));

  var response = await http.post(
    url + "get_shop_comments.php",
    body: bytes,
  ).catchError((error) {
    print(error.toString());
    return error;
  });


  var result = jsonDecode(response.body);
  printWrapped(response.body);
  if(result["result"]=="ok")
    {
      for(final i in result["comments"])
        shopComments.add(new Shop_Good_Comment(i["id"], i["shop_id"], i["commenter_id"],
            i["commenter_name"], i["comment"], i["time"],i["rate"].toString()));
    }

  return shopComments;

}

Future<String> postShopComment(String username,String password,String shop_id,String comment,
    double rate,GlobalKey<ScaffoldState> globalKey) async {

  List<Shop_Good_Comment> shopComments=[];
  var _body = <String, dynamic> {
    "username": username,
    "password": password,
    "shop_id": shop_id,
    "comment": comment,
    "rate":rate
  };
  var bytes = utf8.encode(json.encode(_body));

  print("shop comment");
  var response = await http.post(
    url + "post_shop_comment.php",
    body: bytes,
  ).catchError((error) {
    print(error.toString());
    return error;
  });


  var result = jsonDecode(response.body);
  printWrapped(response.body);


  return result["result"];

}

Future<String> addFavoritegood(String username,String password,String goodId,
    GlobalKey<ScaffoldState> globalKey) async {

  var _body = <String, dynamic> {
    "username": username.toString(),
    "password": password.toString(),
    "good_id":goodId.toString(),
  };
  var bytes = utf8.encode(json.encode(_body));
  var response = await http.post(
    url + "add_favorite_good.php",
    body: bytes,
  ).catchError((error) {
    print(error.toString()+"******************************");
  });


  var result = jsonDecode(response.body);

  print(result.toString()+"add");
  return "";
}

Future<String> deleteFavoriteGood(String username,String password,String goodId,
    GlobalKey<ScaffoldState> globalKey) async {

  var _body = <String, dynamic> {
    "username": username.toString(),
    "password": password.toString(),
    "good_id":goodId.toString(),
  };
  var bytes = utf8.encode(json.encode(_body));
  var response = await http.post(
    url + "delete_favorite_good.php",
    body: bytes,
  ).catchError((error) {
    print(error.toString()+"******************************");
  });


  var result = jsonDecode(response.body);

  print(result.toString()+"delete");
  return "";
}

Future<List<String>> getFavotitegood(String username,String password,
    GlobalKey<ScaffoldState> globalKey) async {

  var _body = <String, dynamic> {
    "username": username.toString(),
    "password": password.toString(),
  };
  var bytes = utf8.encode(json.encode(_body));
  var response = await http.post(
    url + "get_favorite_goods.php",
    body: bytes,
  ).catchError((error) {
    print(error.toString()+"******************************");
  });


  var result = jsonDecode(response.body);

  print("555555555555555555555555555555"+response.body+"555555555555555555555555555555");
  List<String> good_liked=[];
  for(final i in result["goods"]){
    good_liked.add(i["good_id"].toString());
    print(i["good_id"]+"666666666");
  }

  return good_liked;
}
Future<void> editPass(String username,String password,String newpass,String firstname,String lastname,String mail,
    GlobalKey<ScaffoldState> globalKey) async {

  var _body = <String, dynamic> {
    "username": username.toString(),
    "password": password.toString(),
    "new_password": newpass.toString(),
    "first_name":firstname.toString(),
    "last_name": lastname.toString(),
    "mail":  mail.toString()
  };
  var bytes = utf8.encode(json.encode(_body));
  var response = await http.post(
    url + "edit_profile.php",
    body: bytes,
  ).catchError((error) {
    print(error.toString()+"**********");
  });


  var result = jsonDecode(response.body);
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  prefs.setString("password", newpass);
  prefs.setString("firstname", firstname);
  prefs.setString("lastName", lastname);
  prefs.setString("email", mail);



  return;
}