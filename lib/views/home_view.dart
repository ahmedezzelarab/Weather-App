import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/widgets/No_Weather_Body.dart';
import 'package:weather_app/widgets/search_view.dart';

import 'package:weather_app/widgets/weather_info_body.dart';

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
        title: const Text('Weather App'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchView();
                }));
              },
              icon: Icon(Icons.search)),
        ],
      ),
      body: BlocBuilder<GetWeathercubit, Weatherstates>(
          builder: (context, state) {
        if (state is Initaialstate) {
          return NoWeatherBody();
        } else if (state is Getweatherloadedstate) {
          return const WeatherInfoBody();
        } else {
          return Text("ooops there were an error ");
        }
      }),
    );
  }
}
