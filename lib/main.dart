import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GetWeathercubit(),
        child: MaterialApp(
            /* theme: ThemeData(
              primarySwatch: getWeatherColor(
                BlocProvider.of<GetWeathercubit>(context)
                    .weathermodel
                    ?.weathercondition,
              ),
            ),*/
            debugShowCheckedModeBanner: false,
            home: const HomeView()));
  }

  //);
}

MaterialColor getWeatherColor(String? conditionName) {
  if (conditionName == null) {
    return Colors.blue;
  }
  switch (conditionName.toLowerCase()) {
    case 'sunny':
    case 'clear':
      return Colors.yellow;
    case 'partly cloudy':
      return Colors.lightBlue;
    case 'cloudy':
    case 'overcast':
    case 'mist':
    case 'fog':
    case 'freezing fog':
      return Colors.grey;
    case 'light drizzle':
    case 'light rain':
    case 'patchy light rain':
    case 'patchy light drizzle':
    case 'patchy freezing drizzle possible':
    case 'patchy rain with thunder':
      return Colors.lightBlue;
    case 'moderate rain':
    case 'moderate rain at times':
    case 'heavy rain':
    case 'heavy rain at times':
    case 'patchy freezing rain':
    case 'light freezing rain':
    case 'moderate or heavy freezing rain':
    case 'light showers of ice pellets':
    case 'moderate or heavy showers of ice pellets':
    case 'light sleet showers':
    case 'moderate or heavy sleet showers':
      return Colors.blue;
    case 'light snow':
    case 'patchy light snow':
    case 'patchy sleet possible':
    case 'patchy moderate snow':
    case 'moderate snow':
    case 'patchy heavy snow':
    case 'heavy snow':
    case 'light snow showers':
    case 'moderate or heavy snow showers':
      return Colors.grey;

    case 'thundery outbreaks possible':
    case 'moderate or heavy rain with thunder':
    case 'patchy light rain with thunder':
    case 'moderate or heavy snow with thunder':
    case 'patchy light snow with thunder':
    case 'blowing snow':
    case 'blizzard':
    case 'ice pellets':
    case 'torrential rain shower':
      return Colors.deepPurple;

    default:
      return Colors.grey;
  }
}
