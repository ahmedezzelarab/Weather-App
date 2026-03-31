class Weathermodel {
  final String cityNAme;
  final DateTime date;
  final double maxtemp;
  final double mintemp;
  final double temp;
  final String image;
  final String weathercondition;

  Weathermodel(
      {required this.cityNAme,
      required this.date,
      required this.maxtemp,
      required this.mintemp,
      required this.temp,
      required this.image,
      required this.weathercondition});

  factory Weathermodel.fromjson(json) {
    return Weathermodel(
        cityNAme: json['location']['name'],
        date: DateTime.parse(json['current']['last_updated']),
        maxtemp: json['forecast']['forecast_day'][0]['day']['maxtemp_c'],
        mintemp: json['forecast']['forecast_day'][0]['day']['mintemp_c'],
        temp: json['forecast']['forecast_day'][0]['day']['avgtemp_c'],
        image: json['forecast']['forecast_day'][0]['day']['condition']['icon'],
        weathercondition: json['forecast']['forecast_day'][0]['day']
            ['condition']);
  }
}
