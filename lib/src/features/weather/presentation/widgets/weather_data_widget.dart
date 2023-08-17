import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;
import 'package:sample_architecture_project/src/constants/data_constants.dart';
import 'package:sample_architecture_project/src/constants/theme_constants.dart';
import 'package:sample_architecture_project/src/features/weather/domain/entities/weather.dart';

class WeatherDataWidget extends StatelessWidget {
  const WeatherDataWidget(
      {super.key, required this.weather, required this.cityName});

  final WeatherEntity weather;
  final String cityName;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              toBeginningOfSentenceCase(cityName) ?? cityName,
              style: customTextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 15),
            Text(
              weather.weatherCondition.text,
              style: customTextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 10),
            Image.network('https:${weather.weatherCondition.icon}'),
          ],
        ),
        const SizedBox(height: 10),
        Table(
          defaultColumnWidth: const FixedColumnWidth(150.0),
          border: TableBorder.all(
            color: Colors.grey,
            style: BorderStyle.solid,
            width: 1,
          ),
          children: [
            TableRow(children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Temperature',
                  style: TextStyle(
                    fontSize: 16.0,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    '${weather.temperature} °C',
                    style: const TextStyle(
                      fontSize: 16.0,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ]),
            TableRow(children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Feels like',
                  style: TextStyle(
                    fontSize: 16.0,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    '${weather.feelsLikeTemp} °C',
                    style: const TextStyle(
                        fontSize: 16.0,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ]),
            TableRow(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Humidity',
                    style: TextStyle(
                      fontSize: 16.0,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      '${weather.humidity} %',
                      style: const TextStyle(
                        fontSize: 16.0,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Precipitation',
                    style: TextStyle(
                      fontSize: 16.0,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      '${weather.precipatation} mm',
                      style: const TextStyle(
                        fontSize: 16.0,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Clouds Cover',
                    style: TextStyle(
                      fontSize: 16.0,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      '${weather.cloudCover} %',
                      style: const TextStyle(
                        fontSize: 16.0,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Wind Speed',
                    style: TextStyle(
                      fontSize: 16.0,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      '${weather.windSpeed} kph',
                      style: const TextStyle(
                        fontSize: 16.0,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'UV Index',
                    style: TextStyle(
                      fontSize: 16.0,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      '${weather.uvIndex} ${weather.uvIndex.uvDescription}',
                      style: const TextStyle(
                        fontSize: 16.0,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
