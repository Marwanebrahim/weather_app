import 'package:flutter/material.dart';
import 'package:weather_app/models/current_weather.dart';
import 'package:weather_app/models/daily_forcast_weather.dart';
import 'package:weather_app/models/hourly_forcast_weather.dart';
import 'package:weather_app/widgets/current_weather_widget.dart';

class WeatherListViev extends StatelessWidget {
  final CurrentWeather currentWeather;
  final List<HourlyForcastWeather> hourly;
  final List<DailyForcastWeather> daily;
  const WeatherListViev({
    super.key,
    required this.currentWeather,
    required this.hourly,
    required this.daily,
  });
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10),
      children: [CurrentWeatherWidget(currentWeather: currentWeather)],
    );
  }
}
