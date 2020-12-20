import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var locationMsg = '';

  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    var lat = position.latitude;
    var lon = position.longitude;

    setState(() {
      locationMsg = 'Longitude: ${lon},  Longitude: ${lat}';
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.orangeAccent, appBar: new AppBar(
      title: Text('Current Location'), centerTitle: true, backgroundColor: Colors.black,),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.location_on, size: 46, color: Colors.redAccent,),
          SizedBox(height: 10,),

          Text('Get User Location', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),

          Text(locationMsg, style: TextStyle(color: Colors.black),),

          FlatButton(onPressed: (){

            getCurrentLocation();

          },
              color: Colors.black,
              child: Text('Get User Location',
            style: TextStyle(color: Colors.white),))
        ],
      ),
    ),
    );
  }
}
