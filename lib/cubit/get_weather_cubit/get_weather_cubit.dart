import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/servers/weatherserver.dart';

class GetWeathercubit extends Cubit<Weatherstates> {
  GetWeathercubit() : super(Initaialstate());
  late Weathermodel weathermodel;
  getWeather({required String cityName}) async {
    try {
      weathermodel =
          await Weatherserver(Dio()).getcurrentweather(cityName: cityName);

      emit(Getweatherloadedstate());
    } catch (e) {
      emit(Getweathererrorstate());
    }
  }
}
