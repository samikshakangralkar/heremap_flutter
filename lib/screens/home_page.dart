
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:here_app/models/map_data_model.dart';
import 'package:here_app/screens/hotel_detail.dart';
import 'package:here_sdk/mapview.dart';
import 'package:here_sdk/core.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  const Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  double lat = 0.0;
  double lon = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentLocation();
  }
  List<Items> results = [];
  getLocationPins(lat, lon) async{
    var response = await http.get(Uri.parse('https://places.ls.hereapi.com/places/v1/discover/explore?at=$lat%2C$lon&tf=html&Accept-Language=en-US%2Cen%3Bq%3D0.5&app_id=7qPyjbK7oMob1oUwnZte&app_code=lOXi1eez5k8TjtCnrJzGXg'));
    var heredata = jsonDecode(response.body)['results']['items'] as List;

    setState(() {
      results = heredata.map((tagJson) => Items.fromJson(tagJson)).toList();
    });
    print('reslts is ${results[0].position[0]} ${results[0].position[1]}');
  }

  getCurrentLocation() async {
    final geoposition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    setState(() {
      lat = geoposition.latitude;
      lon = geoposition.longitude;
      getLocationPins(lat, lon);
    });
    print('lap $lat long $lon');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter here map"),
          leading: Icon(Icons.map),
        ),
      body: results.length == 0 ? Center(
        child: CircularProgressIndicator(),
      ) : HereMap(
        onMapCreated: _onMapCreated,
      ),
    );
  }

  void _onMapCreated(HereMapController hereMapController){
    hereMapController.mapScene.loadSceneForMapScheme(MapScheme.satellite, (error) {
      if(error != null){
        return;
      }
      hereMapController.initialize((event) {

      });
      double distanceToEarthInMeters = 8000;
      hereMapController.camera.lookAtPointWithDistance(GeoCoordinates(lat, lon), distanceToEarthInMeters);
      // 12.972442, 77.580643
      print('lap--- $lat long $lon');
      hereMapController.pinWidget(Icon(Icons.person_pin_circle, color: Colors.blue,), GeoCoordinates(lat, lon));
      for(int i=0; i < results.length -1; i++) {
        hereMapController.pinWidget(InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => HotelDetail(items: results[i],),));
          },
          child: Card(child: Container(
              padding: EdgeInsets.all(5),
              child: Row(
            children: [
              Icon(Icons.hotel_rounded, color: Colors.blue,),
              Text(' ${results[i].title}'),
            ],
          ))),
        ), GeoCoordinates(results[i].position[0], results[i].position[1]));
      }
    });
  }
}