import 'dart:async';
import 'dart:convert';

import 'package:chalee/model/json/Location.dart';
import 'package:chalee/screens/SelectionActivity.dart';
import 'package:chalee/services/api.dart';
import 'package:chalee/value/ColorApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Profile.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Map<MarkerId, Marker> _markers = <MarkerId, Marker>{};
  int _markerIdCounter = 0;
  Completer<GoogleMapController> _controller = Completer();
  LatLng showLoc;

  LocationModel address;

  //center pos
  CameraPosition centerLatLng;

  final myController = TextEditingController();

  BitmapDescriptor customIcon;

  Future<void> goCurrentLocation() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(showLoc.latitude, showLoc.longitude),
      zoom: 15.4746,
    )));
  }

  //todo handle
  void _getLocation() async {
    var currentLoc = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);

    goCurrentLocation();

/*    setState(() {
      showLoc = new LatLng(currentLoc.latitude, currentLoc.longitude);
    });*/
  }

  createMarket(BuildContext context) {
    if (customIcon == null) {
      ImageConfiguration imageConfiguration =
          createLocalImageConfiguration(context);
      BitmapDescriptor.fromAssetImage(
              imageConfiguration, 'assets/images/loc.png')
          .then((value) => setState(() {
                customIcon = value;
              }));
    }
  }

  @override
  void initState() {
    showLoc = LatLng(35.719957, 51.406021);
    _getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    createMarket(context);
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              myLocationButtonEnabled: true,
              zoomControlsEnabled: false,
              markers: Set<Marker>.of(_markers.values),
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: showLoc,
                zoom: 15.5,
              ),
              myLocationEnabled: true,
              onCameraMove: (CameraPosition position) {
                centerLatLng = position;
                if (_markers.length > 0) {
                  MarkerId markerId = MarkerId(_markerIdVal());
                  Marker marker = _markers[markerId];
                  Marker updatedMarker = marker.copyWith(
                    positionParam: position.target,
                  );
                  setState(() {
                    _markers[markerId] = updatedMarker;
                  });
                }
              },
            ),
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: RaisedButton(
                    onPressed: () => _showMyDialog(context),
                    child: Text(
                      "SAVE",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: "main",
                        fontSize: 18,
                      ),
                    ),
                    color: ColorApp.primary,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                  )),
            )
          ],
        ),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) async {
    _controller.complete(controller);
    if (showLoc != null) {
      MarkerId markerId = MarkerId(_markerIdVal());
      LatLng position = showLoc;
      Marker marker = Marker(
        markerId: markerId,
        position: position,
        icon: customIcon,
        draggable: false,
      );

      setState(() {
        _markers[markerId] = marker;
      });

      Future.delayed(Duration(seconds: 1), () async {
        GoogleMapController controller = await _controller.future;
        controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: position,
              zoom: 15.0,
            ),
          ),
        );
      });
    }
  }

  String _markerIdVal({bool increment = false}) {
    String val = 'marker_id_$_markerIdCounter';
    if (increment) _markerIdCounter++;
    return val;
  }

  Future<void> _showMyDialog(BuildContext scaffoldContext) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text('Complete Choose Location'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Enter your current location:'),
                TextField(
                  controller: myController,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                if (myController.text.isNotEmpty) {
                  _submitLocation(context);
                } else {
                  _scaffoldKey.currentState.showSnackBar(
                    SnackBar(
                      content: Container(
                          height: 50.h,
                          child: Center(
                            child: Text("please fill address text"),
                          )),
                    ),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  _submitLocation(BuildContext context) async {
    address = LocationModel(
        lat: centerLatLng.target.latitude,
        lng: centerLatLng.target.longitude,
        address: myController.text);
    String username;
    String password;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("address", true);
    prefs.setString("addressData", jsonEncode(address));
    username=prefs.getString("username");
    password=prefs.getString("password");
    //addAddress(address,username,password,_scaffoldKey);




      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
  }
}
