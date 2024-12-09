import 'package:weather_app/models/weather_model.dart';

class WeatherState {}

class NoWeatherState extends WeatherState {}

class WeatherLoadedSuccessfullSatate extends WeatherState {
  final WeatherModel weatherModel;

  WeatherLoadedSuccessfullSatate({required this.weatherModel});
}

class WeatherFailureSatate extends WeatherState {
  final String errMessage;

  WeatherFailureSatate({required this.errMessage});
}
