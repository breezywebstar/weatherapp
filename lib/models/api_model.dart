import 'package:flutter/material.dart';

class WeatherResponse {
  final int currentTemp;
  final String name;
  final description;
  final imageUrl;

  WeatherResponse({
    required this.currentTemp,
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    return WeatherResponse(
        currentTemp: json['current']['temperature'],
        name: json['request']['query'],
        description: json['current']['weather_descriptions'][0],
        imageUrl: json['current']['weather_icons'][0]);
  }
}
