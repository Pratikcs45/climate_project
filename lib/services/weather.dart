import 'package:climate_project/screens/location.dart';
import 'package:climate_project/screens/location_screen.dart';
import 'package:climate_project/services/networking.dart';
import 'package:geolocator/geolocator.dart';

const apiKey = '329f85a5319d695edb7ab5d662e04386';
const openWeatheMapUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  get cityName => null;

  Future<dynamic> getCityWeather(cityName) async {
    var url = "$openWeatheMapUrl?q=$cityName&appid=$apiKey&units=metric";
    print(url);
    ;
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getLocation();
    if (location.latitude == 0) {
      return null;
    }

    NetworkHelper network = NetworkHelper(
        "$openWeatheMapUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric");

    var weatherData = await network.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
