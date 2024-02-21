class Weather {
  String cityName;
  double temp;
  String mainCondition;
  double windSpeed;
  int humidty;
  double visibility;

  Weather(
      {required this.cityName,
      required this.temp,
      required this.mainCondition,
      required this.windSpeed,
      required this.humidty,
      required this.visibility});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temp: json['main']['temp'].toDouble(),
      mainCondition: json['weather'][0]['main'],
      windSpeed: json['wind']['speed'].toDouble(),
      humidty: json['main']['humidity'],
      visibility: json['visibility'] / 1000,
    );
  }
}
