import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = 'e94f29898b51409e98a205522241911';
  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
          '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1&aqi=no&alerts=no');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'oops Something went wrong, try leter';

      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops Something went wrong, try leter');
    }
  }
}
