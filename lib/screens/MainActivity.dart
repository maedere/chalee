import 'package:chalee/model/local/CartModel.dart';
import 'package:chalee/model/local/MainCatagory.dart';
import 'package:chalee/screens/HistoryActivity.dart';
import 'package:chalee/screens/MyCartActivity.dart';
import 'package:chalee/screens/SearchActivity.dart';
import 'package:chalee/screens/Setting.dart';
import 'package:chalee/value/ColorApp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainActivity extends StatefulWidget{

  final MainCatagory mainCatagory;

  MainActivity({@required this.mainCatagory});

  @override
  _MainActivityState createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {
  int _selectedIndex = 0;


  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: Scaffold(
        body : _selectedIndex == 0 ? SearchActivity(mainCatagory: widget.mainCatagory,) :
      _selectedIndex == 1 ? HistoryActivity() :
        _selectedIndex == 2 ? MyCartActivity() :
         Setting() ,
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image(image: AssetImage("assets/images/search.png",),width: 20,height: 20,color: Colors.black,),
              title: Text('Search'),
            ),
            BottomNavigationBarItem(
              icon: Image(image: AssetImage("assets/images/list.png",),width: 20,height: 20,color: Colors.black,),
              title: Text('History'),
            ),
            BottomNavigationBarItem(
              icon: Image(image: AssetImage("assets/images/basket.png",),width: 20,height: 20,color: Colors.black,),
              title: Text('My cart'),
            ),
            BottomNavigationBarItem(
              icon: Image(image: AssetImage("assets/images/person.png",),width: 20,height: 20,color: Colors.black,),
              title: Text('Profile'),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: ColorApp.primary,
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.black,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}