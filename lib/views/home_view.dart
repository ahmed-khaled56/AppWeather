import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/searchView.dart';
import 'package:weather_app/widgets/NoWeatherBody.dart';
import 'package:weather_app/widgets/WeatherInfoBody.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Weather App',
          ),
          actions: [
            IconButton(
              //splashColor: Colors.grey,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Searchview();
                  }),
                );
              },
              icon: Icon(
                Icons.search,
                //color: Colors.white,
                size: 30,
              ),
            ),
          ]),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is NoWeatherState) {
            return NoWeatherBody();
          } else if (state is WeatherLoadedSuccessfullSatate) {
            return WeatherInfoBody();
          } else {
            return Center(
              child: Text(
                'Opps there is an error please try later !!',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
