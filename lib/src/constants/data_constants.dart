const String weatherApiBaseUrl = 'https://api.weatherapi.com/v1';
const String weatherApiKey = 'bda6f47028c34e9ca1662356231608';
String getCurrentWeatherByName(String cityName) =>
    '$weatherApiBaseUrl/current.json?key=$weatherApiKey&q=$cityName&aqi=no';

extension UVIndexDescription on double {
  String get uvDescription {
    if (this >= 0 && this <= 2) {
      return 'Low';
    } else if (this >= 3 && this <= 7) {
      return 'Moderate';
    } else if (this >= 8) {
      return 'Very high';
    } else {
      return ''; // Add more ranges and descriptions as needed
    }
  }
}
