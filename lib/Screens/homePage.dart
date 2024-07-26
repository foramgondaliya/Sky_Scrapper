import 'package:flutter/material.dart';
import 'package:weather_app/Model/weatherData.dart';
import 'package:weather_app/helpers/apiHelpers.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();

  late Future<WeatherData?> getAllPics;

  @override
  void initState() {
    super.initState();
    getAllPics = Apihelpers.apihelper.fetchData(Search: "rajkot");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "HomePage",
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Search Here...",
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        getAllPics = Apihelpers.apihelper
                            .fetchData(Search: searchController.text);
                      });
                    },
                    icon: Icon(Icons.search),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 8,
              child: FutureBuilder<WeatherData?>(
                future: getAllPics,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("ERROR: ${snapshot.error}"),
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasData) {
                    WeatherData? data = snapshot.data;

                    if (data == null) {
                      return Center(
                        child: Text("No data available"),
                      );
                    } else {
                      return Column(
                        children: [
                          Text(
                            data.locationName,
                            style: TextStyle(fontSize: 24),
                          ),
                          Text("Region: ${data.region}"),
                          Text("Country: ${data.country}"),
                          Text(
                              "Temperature: ${data.tempC} °C / ${data.tempF} °F"),
                          Text("Condition: ${data.conditionText}"),
                          Image.network("https:${data.conditionIcon}"),
                          Text("Wind: ${data.windKph} kph"),
                          Text("Humidity: ${data.humidity}%"),
                          Text("Cloud: ${data.cloud}%"),
                          Text(
                              "Feels Like: ${data.feelslikeC} °C / ${data.feelslikeF} °F"),
                        ],
                      );
                    }
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
