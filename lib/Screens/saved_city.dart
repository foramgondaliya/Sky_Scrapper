import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/SavedCity_Provider.dart';
import 'package:weather_app/Model/weatherData.dart';

class SavedCity extends StatefulWidget {
  const SavedCity({super.key});

  @override
  State<SavedCity> createState() => _SavedCityState();
}

class _SavedCityState extends State<SavedCity> {
  @override
  Widget build(BuildContext context) {
    final savedLocationsProvider = Provider.of<SavedLocationsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "City Management",
        ),
      ),
      body: ListView.builder(
        itemCount: savedLocationsProvider.savedLocations.length,
        itemBuilder: (context, i) {
          final location = savedLocationsProvider.savedLocations[i];
          return Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Card(
              elevation: 5,
              child: Container(
                alignment: Alignment.center,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://i.pinimg.com/564x/a9/68/8f/a9688f11400d27847eb7a0d4d063c47f.jpg"),
                  ),
                ),
                child: ListTile(
                  onTap: () {
                    WeatherData? weatherData = savedLocationsProvider
                        .getWeatherDataForLocation(location);
                    if (weatherData != null) {
                      Navigator.of(context).pushNamed(
                        'detailPage',
                        arguments: weatherData,
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Weather data not available")),
                      );
                    }
                  },
                  title: Text(
                    location,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      savedLocationsProvider.removeLocation(location);
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
