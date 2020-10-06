
import 'package:chalee/model/json/ProductModel.dart';
import 'package:flutter/cupertino.dart';

class DetailProductModel{

  final List<SubCategories> listSub;
  final List<ProductModel> products;

  DetailProductModel({@required this.listSub , @required this.products});
}