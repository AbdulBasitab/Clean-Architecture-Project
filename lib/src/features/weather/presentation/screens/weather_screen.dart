import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_architecture_project/src/constants/theme_constants.dart';
import 'package:sample_architecture_project/src/features/weather/presentation/providers/weather_provider.dart';
import 'package:sample_architecture_project/src/features/weather/presentation/widgets/weather_data_widget.dart';
import 'package:sample_architecture_project/src/features/weather/presentation/widgets/weather_error_widget.dart';

class WeatherScreen extends ConsumerStatefulWidget {
  const WeatherScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends ConsumerState<WeatherScreen> {
  TextEditingController cityNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final cityName = ref.watch(cityNameProvider);
    final weather = ref.watch(weatherProvider);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.darkPurple,
          title: Text(
            "Weather",
            style: customTextStyle(
              fontSize: 26,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: 50,
            vertical: 30,
          ),
          children: [
            TextField(
              controller: cityNameController,
              keyboardType: TextInputType.name,
              cursorColor: AppColors.lightPurple,
              style: customTextStyle(
                fontSize: 19,
                color: Colors.black,
              ),
              textInputAction: TextInputAction.search,
              onSubmitted: (value) {
                if (cityNameController.text.isNotEmpty) {
                  ref.read(cityNameProvider.notifier).state = value;
                  ref.read(weatherProvider.notifier).getCurrentWeatherOfCity();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "City Name cannot be empty",
                        style: customTextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              decoration: InputDecoration(
                hintText: 'Enter city name',
                hintStyle:
                    customTextStyle(fontSize: 18, color: Colors.grey.shade500),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    width: 2,
                    color: AppColors.lightPurple,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    width: 2,
                    color: AppColors.lightPurple,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            weather.when(
              data: (data) => (data == null)
                  ? const WeatherErrorWidget(
                      error: "Something went wrong, Please try again")
                  : WeatherDataWidget(weather: data, cityName: cityName),
              loading: () => const Center(
                child: CircularProgressIndicator(
                  color: AppColors.lightPurple,
                ),
              ),
              error: (error, stackTrace) =>
                  WeatherErrorWidget(error: error.toString()),
            ),
          ],
        ),
      ),
    );
  }
}
