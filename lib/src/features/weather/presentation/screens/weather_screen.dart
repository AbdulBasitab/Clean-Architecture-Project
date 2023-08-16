import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_architecture_project/src/constants/theme_constants.dart';

class WeatherScreen extends ConsumerStatefulWidget {
  const WeatherScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends ConsumerState<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Weather",
          style: customTextStyle(fontSize: 24, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView(),
    );
  }
}
