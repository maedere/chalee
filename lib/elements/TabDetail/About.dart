import 'dart:async';

import 'package:chalee/model/json/ShopModel.dart';
import 'package:chalee/value/ColorApp.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class About extends StatefulWidget{

  final Shop shop;

  About({@required this.shop});

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {

  Completer<GoogleMapController> _controller = Completer();
  static CameraPosition _kGooglePlex;

  @override
  void initState() {
      _kGooglePlex = CameraPosition(
      target: LatLng(double.parse(widget.shop.lat), double.parse(widget.shop.lng)),
      zoom: 15.4746,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20,),

        Text("  Name : "+widget.shop.name),

        SizedBox(height: 20,),
        Text("  Address : "+widget.shop.address),
        SizedBox(height: 20,),


        Container(
          margin: EdgeInsets.symmetric(horizontal: 15 , vertical: 10),
          height: MediaQuery.of(context).size.height/3,
          decoration: BoxDecoration(
            border: Border.all(color: ColorApp.primary)
          ),
          child: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              _add();
            },
            markers: Set<Marker>.of(markers.values),
          ),
        ),


      ],
    );
  }

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{}; // CLASS MEMBER, MAP OF MARKS

  void _add() {
    var markerIdVal = "location";
    final MarkerId markerId = MarkerId(markerIdVal);

    // creating a new MARKER
    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(
        37.42796133580664 ,-122.085749655962,
      ),
    );

    setState(() {
      // adding a new marker to map
      markers[markerId] = marker;
    });
  }

}