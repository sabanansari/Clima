import 'package:flutter/material.dart';
import 'package:get_weather/services/location.dart';
import 'package:get_weather/services/networking.dart';

const apiKey = 'd7d722850a712f1df1d0566396929b91';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location location = Location();
  double longitude;
  double latitude;

  void getLocationData() async {
    await location.getCurrentLocation();
    longitude = location.longitude;
    latitude = location.latitude;

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
    var weatherData = await networkHelper.getData();
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
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
