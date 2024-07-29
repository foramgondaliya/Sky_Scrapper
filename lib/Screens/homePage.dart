import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Model/weatherData.dart';
import 'package:weather_app/Screens/saved_city.dart';
import 'package:weather_app/helpers/apiHelpers.dart';
import 'package:weather_app/provider/SavedCity_Provider.dart';
import 'package:weather_app/provider/themeProvider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();
  WeatherData? currentWeatherData;

  @override
  Widget build(BuildContext context) {
    final savedLocationsProvider = Provider.of<SavedLocationsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "HomePage",
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.location_city),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => SavedCity()),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Switch(
              value: Provider.of<ThemeProvider>(context).istap,
              onChanged: (val) {
                Provider.of<ThemeProvider>(context, listen: false)
                    .changetheme(val);
              },
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://i.pinimg.com/564x/a8/e4/43/a8e443d8f29b9784b779766d616c30ed.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        cursorColor: Colors.white,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          suffixStyle: TextStyle(
                            color: Colors.white,
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        onSubmitted: (value) async {
                          final weatherData = await Apihelpers.apihelper
                              .fetchData(Search: searchController.text);
                          if (weatherData != null) {
                            setState(() {
                              currentWeatherData = weatherData;
                              searchController.clear();
                            });
                            savedLocationsProvider.addLocation(
                                weatherData.locationName, weatherData);
                          }
                        },
                      ),
                    ),
                  ],
                ),
                if (currentWeatherData != null)
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${currentWeatherData!.locationName}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "${currentWeatherData!.localtime}",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "${currentWeatherData!.tempC}°",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 74,
                                ),
                              ),
                              Text(
                                "${currentWeatherData!.conditionText}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Icon(Icons.water_drop, color: Colors.white),
                                  SizedBox(width: 5),
                                  Text(
                                    "Humidity: ${currentWeatherData!.humidity}%",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Icon(Icons.air, color: Colors.white),
                                  SizedBox(width: 5),
                                  Text(
                                    "Wind: ${currentWeatherData!.windKph} kph",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 30),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Icon(Icons.thermostat,
                                            color: Colors.white),
                                        SizedBox(height: 5),
                                        Text(
                                          "Feels like (C)",
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          "${currentWeatherData!.feelslikeC}°C",
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Icon(Icons.wb_sunny,
                                            color: Colors.white),
                                        SizedBox(height: 5),
                                        Text(
                                          "UV Index",
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          "${currentWeatherData!.uv}",
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Icon(Icons.thermostat,
                                            color: Colors.white),
                                        SizedBox(height: 5),
                                        Text(
                                          "Feels like (F)",
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          "${currentWeatherData!.feelslikeF}°F",
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),
                              Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(
                                        'detailPage',
                                        arguments: currentWeatherData);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    // color: Colors.blueAccent,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 15),
                                    textStyle: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  child: Text('View More'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
