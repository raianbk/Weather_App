import 'package:api_tests/const/consts.dart';
import 'package:api_tests/models/color_provider.dart';
import 'package:api_tests/models/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ForecastTile extends StatelessWidget {
  final Weather? weather;
  final FaIcon icon;
  const ForecastTile({super.key, required this.weather, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10, bottom: 30),
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
      decoration: BoxDecoration(
        color: context.watch<ColorProvider>().changeColor,
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "${weather?.temp.round() ?? " "}°",
            style: const TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          icon,
          const Text(
            '21 Jan',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
