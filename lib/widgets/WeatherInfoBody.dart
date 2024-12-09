import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              getWeatherColor(weatherModel.weatherCondition),
              getWeatherColor(weatherModel.weatherCondition)[300]!,
              getWeatherColor(weatherModel.weatherCondition)[50]!,
            ]),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            weatherModel.cityName,
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            weatherModel.date,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Container(
                height: 70,
                width: 70,
                child: weatherModel.image.contains("https:")
                    ? Image.network(weatherModel.image)
                    : Image.network("https:${weatherModel.image}"),
              ),
              Spacer(
                flex: 1,
              ),
              Text(
                weatherModel.averTemp.round().toString(),
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(
                flex: 1,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'minTemp:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        weatherModel.minTemp.round().toString(),
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'maxTemp:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        weatherModel.maxTemp.round().toString(),
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          Text(
            weatherModel.weatherCondition,
            style: TextStyle(
                fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
