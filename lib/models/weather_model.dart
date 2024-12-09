class WeatherModel {
  final String cityName;
  final String date;
  final double maxTemp;
  final double minTemp;
  final double averTemp;
  final String image;
  final String weatherCondition;

  WeatherModel(
      {required this.cityName,
      required this.date,
      required this.maxTemp,
      required this.minTemp,
      required this.averTemp,
      required this.image,
      required this.weatherCondition});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['location']['name'] ?? 'Unknown',
      date: json['current']['last_updated'] ?? 'Unknown',
      maxTemp:
          json['forecast']['forecastday'][0]['day']['maxtemp_c'] ?? 'Unknown',
      minTemp:
          json['forecast']['forecastday'][0]['day']['mintemp_c'] ?? 'Unknown',
      averTemp:
          json['forecast']['forecastday'][0]['day']['avgtemp_c'] ?? 'Unknown',
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'] ??
          'Unknown',
      weatherCondition: json['forecast']['forecastday'][0]['day']['condition']
              ['text'] ??
          'Unknown',
    );
  }
}
