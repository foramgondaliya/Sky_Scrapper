import 'package:flutter/material.dart';
import 'package:weather_app/Model/weatherData.dart';

class SavedLocationsProvider with ChangeNotifier {
  List<String> savedLocations = [];
  Map<String, WeatherData> weatherDataMap = {};

  void addLocation(String location, WeatherData weatherData) {
    savedLocations.add(location);
    weatherDataMap[location] = weatherData;
    notifyListeners();
  }

  void removeLocation(String location) {
    savedLocations.remove(location);
    weatherDataMap.remove(location);
    notifyListeners();
  }

  WeatherData? getWeatherDataForLocation(String location) {
    return weatherDataMap[location];
  }
}
