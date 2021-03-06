import 'dart:convert';



class GetORder {
  GetORder({
    this.result,
    this.orders,
  });

  String result;
  Orders orders;



}

class Orders {
  Orders(
    this.id,
    this.shopId,
    this.shopName,
    this.shopImageUrl,
    this.shopAcceptTime,
    this.totalPayment,
    this.time,
    this.status,
      this.goods,
  );

  String id;
  String shopId;
  String shopName;
  String shopImageUrl;
  int shopAcceptTime;
  double totalPayment;
  int time;
  String status;
  List<Goods> goods;




}
class SimpleGood{
  String id;
  int count;

  SimpleGood(this.id, this.count);
}

class Goods {
  Goods(
    this.id,
    this.name,
    this.imageUrl,
    this.price,
    this.discount,
    this.count,
      this.shopName
  );



  String id;
  String name;
  String imageUrl;
  double price;
  double discount;
  int count;
  String shopName;


Map<String, dynamic> toJson() => {
  "id": id,
  "name": name,
  "image_url": imageUrl,
  "price": price,
  "discount": discount,
  "count": count,
};
}
