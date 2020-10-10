import 'package:chalee/elements/CartItem.dart';
import 'package:chalee/model/json/ProductModel.dart';
import 'package:chalee/model/local/CartModel.dart';
import 'package:chalee/screens/CheckOut.dart';
import 'package:chalee/util/Constant.dart';
import 'package:chalee/value/ColorApp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MyCartActivity extends StatefulWidget {
  @override
  _MyCartActivityState createState() => _MyCartActivityState();
}

class _MyCartActivityState extends State<MyCartActivity> {
  @override
  Widget build(BuildContext context) {
     List<ProductModel> orders1 = [];
     for(final i in Constant.orders)
     { if(i.count!=0)
       orders1.add(i);}
     Constant.orders=orders1;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.black,
            ),
            onPressed: null),
        centerTitle: true,
        title: Text(
          "My Cart",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.grey[300],
        child: Stack(
          children: [


            Constant.orders.length == 0 ? SizedBox():
           ListView.builder(
             itemCount: Constant.orders.length,
               itemBuilder: (context , i){
                  return _CartItemData(Constant.orders[i]);


              }),
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CheckOut()),
                      );
                    },
                    child: Text("CHECK OUT"),
                    color: ColorApp.primary,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    padding:
                        EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                  )),
            )
          ],
        ),
      ),
    );
  }

  Widget _CartItemData(ProductModel model){

    return Card(
      elevation: 4,
      color: Colors.white,
      margin: EdgeInsets.all(5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(5),
        height: 320.h,
        child: Row(
          children: [
            Image.network(model.image,height: 80,width:80 ),
            SizedBox(
              width: 5,
            ),
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(model.name),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "idont know ",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: SizedBox(),
                ),
                Text(
                  (model.price-model.discount*model.price/100).toStringAsFixed(2),
                  style: TextStyle(color: Colors.red, fontSize: 15),
                ),
                SizedBox(
                  height: 50.h,
                ),
              ],
            ),
            Expanded(
              child: SizedBox(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(icon: Icon(Icons.close), onPressed: (){
                  setState(() {
                    Constant.orders.remove(model);
                  });

                }),
                Expanded(
                  child: SizedBox(),
                ),
                Row(
                  children: [
                    IconButton(icon : Icon(Icons.remove_circle_outline,
                        size: 23, color: Colors.grey),onPressed: (){
                      setState(() {
                        if(model.count-1>0)
                          model.count--;
                        /*else
                          Constant.orders.remove(model);*/

                      });
                    }),
                    Text(model.count.toString() , textAlign: TextAlign.center,),
                    IconButton(
                        icon: Icon(
                          Icons.add_circle_outline,
                          size: 23,
                          color: Colors.grey,
                        ),
                        onPressed: (){
                          setState(() {
                            if(model.count+1<=model.available)
                              model.count++;
                          });
                        }),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}
