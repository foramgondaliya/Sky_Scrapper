class WeatherData {
  final String locationName;
  final String region;
  final String country;
  final double tempC;
  final double tempF;
  final String conditionText;
  final String conditionIcon;
  final double windKph;
  final int humidity;
  final int cloud;
  final double feelslikeC;
  final double feelslikeF;
  final String localtime;
  final double uv;
  final double pressure_in;
  final double pressure_mb;

  WeatherData({
    required this.locationName,
    required this.region,
    required this.country,
    required this.tempC,
    required this.tempF,
    required this.conditionText,
    required this.conditionIcon,
    required this.windKph,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.localtime,
    required this.uv,
    required this.pressure_in,
    required this.pressure_mb,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      pressure_in: json['current']['pressure_in'],
      locationName: json['location']['name'],
      region: json['location']['region'],
      country: json['location']['country'],
      tempC: json['current']['temp_c'],
      tempF: json['current']['temp_f'],
      conditionText: json['current']['condition']['text'],
      conditionIcon: json['current']['condition']['icon'],
      windKph: json['current']['wind_kph'],
      humidity: json['current']['humidity'],
      cloud: json['current']['cloud'],
      feelslikeC: json['current']['feelslike_c'],
      feelslikeF: json['current']['feelslike_f'],
      localtime: json['location']['localtime'],
      uv: json['current']['uv'],
      pressure_mb: json['current']['pressure_mb'],
    );
  }
}
