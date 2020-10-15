import 'package:chalee/elements/ProductMenu.dart';
import 'package:chalee/model/json/ProductModel.dart';
import 'package:chalee/screens/CheckOut.dart';
import 'package:chalee/screens/Detail.dart';
import 'package:chalee/screens/MyCartActivity.dart';
import 'package:chalee/services/api.dart';
import 'package:chalee/util/Constant.dart';
import 'package:chalee/util/faker.dart';
import 'package:chalee/value/ColorApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Menu extends StatefulWidget {

  final String shopId;

  Menu({@required this.shopId});

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  bool like=false;
  bool check = false;
  String dropdownValue = "Select Category";
  String categoryid="";

  List<SubCategories> _listSub = [];
  List<ProductModel> _listProductShow = [];
  List<ProductModel> _listProduct = [];

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  void initState() {

    getProducts(ShopProductRequest(shopId: widget.shopId , rangeId: 0 , subcategoryId: "-1"), _key).then((value){
      setState(() {
        if(value != null) {
          // _listSub = value.listSub;
          // _listProduct = value.products;

          for(final i in value.listSub) {
            _listSub.add(i);

          }
          for(final i in _listSub){
            if(i.name==dropdownValue)
              categoryid=i.id;
          }
          bool hascategory=false;
          for(final i in value.products)
          {
            _listProduct.add(i);

            if(i.categoryId==categoryid)
            {
              _listProductShow.add(i);
              hascategory=true;
            }
          }
          if(hascategory==false)
            _listProductShow=_listProduct;
        }



      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    //   check = false;
    //   _showCheckout();
    return Stack(
      children: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: ColorApp.primary)),
                child: DropdownButton<String>(
                  //todo fuck
                  //  value: dropdownValue,
                  hint: Text(
                    dropdownValue,
                    style: TextStyle(
                        fontFamily: "main", color: Colors.black, fontSize: 15),
                  ),
                  dropdownColor: Colors.white,
                  isExpanded: true,
                  icon: Padding(
                    padding: EdgeInsets.only(
                      left: 10,
                    ),
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                    ),
                  ),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: "main"),
                  underline: SizedBox(),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                      for(final i in _listSub){
                        if(i.name==dropdownValue)
                          categoryid=i.id;
                      }
                      _listProductShow=[];
                      for(final i in _listProduct)
                      {

                        if(i.categoryId==categoryid)
                        {
                          _listProductShow.add(i);
                        }
                      }
                      if(dropdownValue=="Select Category" || dropdownValue=="All")
                      {
                        _listProductShow=_listProduct;
                      }

                    });
                  },
                  items: _listSub.map((e){return  e.name;}).toList()
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                            color: ColorApp.primary,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            fontFamily: "main"),
                      ),
                    );

                  }).toList(),

                ),
              ),
            ),
            Expanded(
              child: GridView.count(
                  padding: EdgeInsets.all(8),
                  crossAxisCount: 2,
                  scrollDirection: Axis.vertical,
                  childAspectRatio: 1,
                  children: //_listProduct.length > 0 ?
                  _listProductShow.map((e){
                    return _productMenu(e);
                  }).toList()

              ),
            ),
          ],
        ),
        if (check)
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 30.h,
              ),
              child: RaisedButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),),
                padding: EdgeInsets.symmetric(horizontal: 30 , vertical: 10),
                onPressed: () => {
                  Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MyCartActivity(),),),
                },
                child: Text(
                  "Check Out",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "main",
                  ),
                ),
                color: ColorApp.primary,
              ),
            ),
          )
      ],
    );
  }

/*  void _showCheckout() {
    for(final element in  Faker.listP){
      print("out if" + element.count.toString());
      if (element.count > 0) {
        print("in if" + element.count.toString());
        setState(() {
          check = true;
        });
        break;
      }
    }
  }*/

  Widget _productMenu(ProductModel product) {
   // bool like=false;
    _check(product);
    return GestureDetector(
      onTap: () {

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Detail(
              image: product.image,
              heroTag: product.name,
              description: product.description,
              finalPrice: (product.price-product.discount*product.price/100).toStringAsFixed(2),
              calory: product.calory,
              spicy : product.spicy,
              id : product.id,
            ),
          ),
        );
      },
      child: Card(
        elevation: 4,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Hero(
                  tag: product.name,
                  child: Image.network(product.image,height: 100,width:100 ),

                ),
              ),
              Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    product.name,
                    textAlign: TextAlign.start,
                  )),
              Row(
                children: [
                  Text(
                    product.price.toString(),
                    style: TextStyle(color: Colors.red, fontSize: 15,decoration: TextDecoration.lineThrough),
                  ),
                  Text(
                    (product.price-(product.discount*product.price/100)).toStringAsFixed(2).toString(),
                    style: TextStyle(color: ColorApp.primary, fontSize: 15),
                  ),
                  IconButton(
                    icon:like == true? Icon(
                      Icons.favorite,
                      color: ColorApp.primary,
                    ):Icon(
                      Icons.favorite_border,
                      color: ColorApp.primary,
                    ),
                    onPressed: (){
                      print(like);
                      setState(() {
                        like=!like;
                      });
                    },
                  ),

                  Expanded(child: SizedBox()),
                  if (product.count == 0)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          product.count = 1;
                        });

                        if (!Constant.orders.contains(product)) {
                          Constant.orders.add(product);
                        }
                      },
                      child: Container(
                        width: 130.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            40,
                          ),
                          color: ColorApp.primary,
                        ),
                        child: Center(
                          child: Text(
                            "ADD",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "main",
                                fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                  if (product.count > 0)
                    GestureDetector(
                      child: Icon(
                        Icons.remove_circle_outline,
                        size: 60.h,
                        color: ColorApp.primary,
                      ),
                      onTap: () {
                        setState(() {
                          product.count--;
                        });
                      },
                    ),
                  if (product.count > 0)
                    SizedBox(
                      width: 2,
                    ),
                  if (product.count > 0) Text(product.count.toString()),
                  if (product.count > 0)
                    SizedBox(
                      width: 2,
                    ),
                  if (product.count > 0)
                    GestureDetector(
                      child: Icon(
                        Icons.add_circle_outline,
                        size: 60.h,
                        color: ColorApp.primary,
                      ),
                      onTap: () {
                        setState(() {
                          if(product.count+1<=product.available)
                            product.count++;

                        });
                      },
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _check(ProductModel p){
    if(p.count!=null)
      if(p.count > 0){
        check = true;
      }

  }
}