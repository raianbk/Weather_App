// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:api_tests/components/info_components.dart';
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
  var time = DateTime.now();
  final String apiKey = " ";
  final _weatherService = WeatherService('c8b1620f56f3f6dafa972acc0a14f9fe');
  Weather? _weather;

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
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Color.fromARGB(206, 0, 0, 0)),
        ),
        centerTitle: true,
        leading: Icon(Icons.menu),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 237, 75),
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
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black),
                child: Text(
                  "${getDate(time.weekday)} ${time.day},${time.year}",
                  style: const TextStyle(
                      color: Color.fromARGB(255, 255, 237, 75), fontSize: 15),
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
                  color: Colors.black,
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
                            color: Color.fromARGB(255, 255, 237, 75),
                            size: 30,
                          )),
                      InfoWidget(
                          temp: "${_weather?.humidty}%",
                          info: "Humidity",
                          icon: FaIcon(
                            FontAwesomeIcons.droplet,
                            color: Color.fromARGB(255, 255, 237, 75),
                            size: 30,
                          )),
                      InfoWidget(
                        temp: "${_weather?.visibility}km",
                        info: "Visibility",
                        icon: FaIcon(
                          FontAwesomeIcons.eye,
                          color: Color.fromARGB(255, 255, 237, 75),
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
                  FaIcon(FontAwesomeIcons.arrowRightLong),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
