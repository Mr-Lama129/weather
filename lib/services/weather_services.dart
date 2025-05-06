
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weather_app/models/weather_model.dart';


class WeatherServices{
  final String apiKey = 'ac5291948a2ffa46288487b4e8c41c6f';
  Future<Weather> fetchWeather(String cityName) async{
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&units=metric&appid=$apiKey'
    );
    final response = await http.get(url);
    if (response.statusCode == 200){
      return Weather.fromjson(jsonDecode(response.body));
    }
    else {
      print('Failed with status: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to load weather data');
    }
  }
}