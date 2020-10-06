import 'package:chalee/model/json/ProductModel.dart';
import 'package:chalee/screens/Detail.dart';
import 'package:chalee/util/Constant.dart';
import 'package:chalee/value/ColorApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductMenu extends StatefulWidget {
  final ProductModel product;

  ProductMenu({@required this.product});

  @override
  _ProductMenuState createState() => _ProductMenuState();
}

class _ProductMenuState extends State<ProductMenu> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Detail(
              image: widget.product.image,
              heroTag: widget.product.username,
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
                  tag: widget.product.username,
                  child: Image(
                    image: AssetImage(widget.product.image),
                  ),
                ),
              ),
              Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    "test item 1",
                    textAlign: TextAlign.start,
                  )),
              Row(
                children: [
                  Text(
                    "\$10  ",
                    style: TextStyle(color: Colors.red, fontSize: 15),
                  ),
                  Text(
                    "\$10 ",
                    style: TextStyle(color: ColorApp.primary, fontSize: 15),
                  ),
                  Expanded(child: SizedBox()),
                  if (widget.product.count == 0)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.product.count = 1;
                        });

                       if (!Constant.orders.contains(widget.product) ){
                         Constant.orders.add(widget.product);
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
                  if (widget.product.count > 0)
                    GestureDetector(
                      child: Icon(
                        Icons.remove_circle_outline,
                        size: 60.h,
                        color: ColorApp.primary,
                      ),
                      onTap: () {
                        setState(() {
                          widget.product.count--;
                        });
                      },
                    ),
                  if (widget.product.count > 0)
                    SizedBox(
                      width: 2,
                    ),
                  if (widget.product.count > 0)
                    Text(widget.product.count.toString()),
                  if (widget.product.count > 0)
                    SizedBox(
                      width: 2,
                    ),
                  if (widget.product.count > 0)
                    GestureDetector(
                      child: Icon(
                        Icons.add_circle_outline,
                        size: 60.h,
                        color: ColorApp.primary,
                      ),
                      onTap: () {
                        setState(() {
                          widget.product.count++;
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
}
