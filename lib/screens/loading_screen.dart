import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_weather/services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location location = Location();
  double longitude;
  double latitude;

  void getLocation() async {
    await location.getCurrentLocation();
    longitude = location.longitude;
    latitude = location.latitude;
  }

  void getData() async {
    http.Response response = await http.get(
        'https://samples.openweathermap.org/data/2.5/weather?lat=latitude&lon=longitude&appid=439d4b804bc8187953eb36d2a8c26a02');
    if (response.statusCode == 200) {
      String data = response.body;
      var decode = jsonDecode(data);
      double temp = decode['main']['temp'];
      int condition = decode['weather'][0]['id'];
      String cityName = decode['name'];
    } else {
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            getLocation();
          },
          child: Text(
            'Get Location',
          ),
        ),
      ),
    );
  }
}
