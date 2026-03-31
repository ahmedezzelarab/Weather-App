import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class Weatherserver {
  final Dio dio;
  final String baseurl = 'http://api.weatherapi.com/v1';
  final String apiKey = 'b2456622c6df4163b14124000231611';
  Weatherserver(this.dio);

  Future<Weathermodel> getcurrentweather({required String cityName}) async {
    try {
      Response response = await dio.get(
          '$baseurl/forecast.json?key=$apiKey&q=$cityName&days=1&aqi=no&alerts=no');

      Weathermodel weathrmodel = Weathermodel.fromjson(response.data);

      return weathrmodel;
    } on DioException catch (e) {
      final String errmessage = e.response?.data['error']['message'] ??
          'oops there was an error , try later';
      throw Exception(errmessage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops there was an error , try later ');
    }
  }
}
