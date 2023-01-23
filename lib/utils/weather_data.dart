import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/models/api_model.dart';

class DataService {
  Future<WeatherResponse> getWeather(String city) async {
    //http://api.weatherstack.com/current?access_key=ac52a5c4335e2185fe12c362a0dd62e4&query=New%20York
    final queryParameters = {
      'access_key': 'ac52a5c4335e2185fe12c362a0dd62e4',
      'query': city
    };
    final uri = Uri.http('api.weatherstack.com', '/current', queryParameters);

    final response = await http.get(uri);

    //print(response.body);
    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}
