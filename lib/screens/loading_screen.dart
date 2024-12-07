import 'package:climate_project/screens/location.dart';
import 'package:climate_project/screens/location_screen.dart';
import 'package:climate_project/services/weather.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = '329f85a5319d695edb7ab5d662e04386';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void geolocation() async {
    // WeatherModel weatherModel = WeatherModel();
    var weatherData = await WeatherModel().getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(weatherData);
    }));
  }

  @override
  void initState() {
    geolocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
        // child: ElevatedButton(
        //   onPressed: () {
        //     geolocation();
        //     // Get the current location
        //   },
        //   child: Text('Get Location'),
        // ),
      ),
    );
  }
}
