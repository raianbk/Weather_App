// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:api_tests/components/forecast_tiles.dart';
import 'package:api_tests/components/info_components.dart';
import 'package:api_tests/const/consts.dart';
import 'package:api_tests/models/weather_model.dart';
import 'package:api_tests/services/weather_services.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  //final time = DateTime.now();
  final String apiKey = " ";
  final _weatherService = WeatherService('c8b1620f56f3f6dafa972acc0a14f9fe');
  Weather? _weather;
  final Color _changedColor = Color.fromARGB(255, 255, 255, 255);
  Color? _color;

  void toWhite() {
    ;
    setState(() {
      _color = _changedColor;
    });
  }

  void toTurq() {
    ;
    setState(() {
      _color = turq;
    });
  }

  String getDate(int day) {
    switch (day) {
      case 1:
        return "Monday";
      case 2:
        return "Tuesday";
      case 3:
        return "Wednesday";
      case 4:
        return "Thursday";
      case 5:
        return "Friday";
      case 6:
        return "Saturday";
      case 7:
        return "Sunday";
    }
    return "";
  }

  _fetchWeather() async {
    String cityName = await _weatherService.getCity();

    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    //TODO: implement initState
    super.initState();

    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          _weather?.cityName ?? "loading",
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: black),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: _color,
        child: ListView(children: [
          ListTile(
            onTap: toWhite,
            title: Text("White"),
          ),
          ListTile(
            onTap: toTurq,
            title: Text("Turquoise"),
          )
        ]),
      ),
      backgroundColor: _color,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.only(
                    left: 14, right: 14, top: 7, bottom: 7),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: black),
                child: Text(
                  "${getDate(time.weekday)} ${time.day},${time.year}",
                  style: TextStyle(color: _color, fontSize: 15),
                ),
              ),
              const SizedBox(height: 10),
              Text(_weather?.mainCondition ?? " ",
                  style: const TextStyle(fontSize: 20)),
              Text(
                "${_weather?.temp.round() ?? " "}°",
                style: const TextStyle(fontSize: 100),
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Daily Summary",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InfoWidget(
                          temp: "${_weather?.windSpeed}km/h",
                          info: "Wind",
                          icon: FaIcon(
                            FontAwesomeIcons.wind,
                            color: _color,
                            size: 30,
                          )),
                      InfoWidget(
                          temp: "${_weather?.humidty}%",
                          info: "Humidity",
                          icon: FaIcon(
                            FontAwesomeIcons.droplet,
                            color: _color,
                            size: 30,
                          )),
                      InfoWidget(
                        temp: "${_weather?.visibility}km",
                        info: "Visibility",
                        icon: FaIcon(
                          FontAwesomeIcons.eye,
                          color: _color,
                          size: 30,
                        ),
                      ),
                    ]),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Weekly Forecaset",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  FaIcon(FontAwesomeIcons.arrowRightLong, size: 20),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Flexible(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ForecastTile(
                      weather: _weather,
                      icon: FaIcon(FontAwesomeIcons.sun, size: 20),
                    ),
                    ForecastTile(
                        weather: _weather,
                        icon: FaIcon(
                          FontAwesomeIcons.cloudSun,
                          size: 20,
                        )),
                    ForecastTile(
                        weather: _weather,
                        icon: FaIcon(FontAwesomeIcons.droplet, size: 20)),
                    ForecastTile(
                        weather: _weather,
                        icon: FaIcon(FontAwesomeIcons.bolt, size: 20)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
