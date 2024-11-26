import 'package:flutter/material.dart';
import 'package:weatherapi_test_tas/core/models/weather_response.dart';

class WeatherContent extends StatelessWidget {
  final WeatherResponse? weatherResponse;

  const WeatherContent({required this.weatherResponse, super.key});

  @override
  Widget build(BuildContext context) {
    final weather = weatherResponse?.current;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${weatherResponse?.location?.name}, ${weatherResponse?.location?.country}',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            '${weather?.tempC}°C',
            style: const TextStyle(fontSize: 48),
          ),
          Text(
            weather?.condition?.text ?? '',
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 16),
          Text('Ветер: ${weather?.windKph} км/ч'),
          Text('Влажность: ${weather?.humidity}%'),
        ],
      ),
    );
  }
}
