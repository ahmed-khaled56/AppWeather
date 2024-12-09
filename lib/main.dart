import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';

import 'views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                // primarySwatch: getWeatherColor(
                //     BlocProvider.of<GetWeatherCubit>(context)
                //         .weatherModel
                //         ?.weatherCondition),

                appBarTheme: AppBarTheme(
                  color: getWeatherColor(
                      BlocProvider.of<GetWeatherCubit>(context)
                          .weatherModel
                          ?.weatherCondition)[700],
                ),
              ),
              debugShowCheckedModeBanner: false,
              home: const HomeView(),
            );
          },
        );
      }),
    );
  }
}

MaterialColor getWeatherColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition.toLowerCase()) {
    case "sunny":
    case "clear":
      return Colors.amber; // Bright yellow for clear skies
    case "partly cloudy":
    case "cloudy":
    case "overcast":
      return Colors.grey; // Shades of grey for cloudy weather
    case "mist":
    case "fog":
    case "freezing fog":
      return Colors.blueGrey; // Foggy or misty weather
    case "patchy rain possible":
    case "light drizzle":
    case "patchy light rain":
    case "light rain":
    case "moderate rain":
    case "rain":
      return Colors.blue; // Shades of blue for rain-related conditions
    case "thundery outbreaks possible":
    case "patchy light rain with thunder":
    case "moderate or heavy rain with thunder":
      return Colors.deepPurple; // Thunderstorm conditions
    case "patchy snow possible":
    case "patchy light snow":
    case "light snow":
    case "moderate snow":
    case "heavy snow":
      return Colors.lightBlue; // Light blue for snowy conditions
    case "light sleet":
    case "moderate or heavy sleet":
    case "ice pellets":
      return Colors.cyan; // Cyan for sleet and ice
    case "torrential rain shower":
    case "moderate or heavy rain shower":
    case "light rain shower":
      return Colors.indigo; // Indigo for heavy showers
    default:
      return Colors.blue; // Default color for unrecognized conditions
  }
}
