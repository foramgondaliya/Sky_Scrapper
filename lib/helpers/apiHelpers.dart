import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/Model/weatherData.dart';

class Apihelpers {
  Apihelpers._();

  static final Apihelpers apihelper = Apihelpers._();

  Future<WeatherData?> fetchData({required String Search}) async {
    final response = await http.get(
      Uri.parse(
          "https://api.weatherapi.com/v1/current.json?key=3cd73ba36dd847d98a4100033242607&q=$Search&aqi=no"),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> decodedData = jsonDecode(response.body);
      WeatherData weather = WeatherData.fromJson(decodedData);
      return weather;
    } else {
      print("Error: ${response.statusCode}");
      return null;
    }
  }
}
