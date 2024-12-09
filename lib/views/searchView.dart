import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class Searchview extends StatelessWidget {
  const Searchview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Search a City',
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width: 390,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  onSubmitted: (value) async {
                    var getWeatherCubit =
                        BlocProvider.of<GetWeatherCubit>(context);
                    getWeatherCubit.getWeather(cityName: value);

                    Navigator.pop(context);
                  },
                  decoration: InputDecoration(
                    labelText: 'Search',

                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 30),

                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                      ),
                    ),
                    hintText: "Enter City name",

                    suffixIcon: const Icon(
                      Icons.search,
                      size: 30,
                    ),
                    // suffixIconColor: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
