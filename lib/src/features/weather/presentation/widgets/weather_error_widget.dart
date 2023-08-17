import 'package:flutter/material.dart';
import 'package:sample_architecture_project/src/constants/theme_constants.dart';

class WeatherErrorWidget extends StatelessWidget {
  const WeatherErrorWidget({super.key, required this.error});

  final String error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        error,
        style: customTextStyle(
          fontSize: 20,
          color: Colors.white60,
        ),
      ),
    );
  }
}
