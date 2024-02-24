// ignore_for_file: prefer_const_constructors

import 'package:api_tests/const/consts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InfoWidget extends StatelessWidget {
  final String temp;
  final String info;
  final FaIcon icon;
  const InfoWidget(
      {super.key, required this.temp, required this.info, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        icon,
        const SizedBox(height: 10),
        Text(
          temp,
          style: TextStyle(
            color: turq,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          info,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
        SizedBox(height: 10)
      ],
    );
  }
}
