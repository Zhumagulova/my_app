import 'dart:convert';

import 'package:http/http.dart' as http;

class WeatherService {
  final String apiKey = 'e640ac88c49641d38b275733242505';
  final String forecastBaseUrl = 'http://api.weatherapi.com/v1/forecast.json';
  final String searchBaseUrl = 'http://api.weatherapi.com/v1/search.json';

  Future<Map<String, dynamic>> fetchCurrentWeather(String city) async {
    final url = '$forecastBaseUrl?key=$apiKey&q=$city&days=7&aqi=no&alerts=no';
    final responce = await http.get(Uri.parse(url));
    if (responce.statusCode == 200) {
      return json.decode(responce.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<Map<String, dynamic>> fetch7DayForecast(String city) async {
    final url = '$forecastBaseUrl?key=$apiKey&q=$city&days=7&aqi=no&alerts=no';
    final responce = await http.get(Uri.parse(url));
    if (responce.statusCode == 200) {
      return json.decode(responce.body);
    } else {
      throw Exception('Failed to load forecast data');
    }
  }

  Future<List<dynamic>?> fetchCitySuggestions(String query) async {
    final url = '$searchBaseUrl?key=$apiKey&q=$query';
    final responce = await http.get(Uri.parse(url));
    if (responce.statusCode == 200) {
      return json.decode(responce.body);
    } else {
      return null;
    }
  }
}
