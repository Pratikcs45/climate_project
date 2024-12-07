import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude;
  late double longitude;

  Future<void> getLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      latitude = 0.00;
      longitude = 0.00;
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('not allow permission');

        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      latitude = 0.00;
      longitude = 0.00;
      print('not allow permission');
      return;
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
      print(position);
    } catch (e) {
      print(e);
    }
  }
}
