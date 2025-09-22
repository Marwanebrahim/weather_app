import 'package:flutter/material.dart';
import 'package:weather_app/models/current_weather.dart';
import 'package:weather_app/models/daily_forcast_weather.dart';
import 'package:weather_app/models/hourly_forcast_weather.dart';
import 'package:weather_app/styles/app_colors.dart';
import 'package:weather_app/styles/app_text_style.dart';
import 'package:weather_app/widgets/calender_widget.dart';
import 'package:weather_app/widgets/current_weather_widget.dart';
import 'package:weather_app/widgets/daily_farcast_widget.dart';
import 'package:weather_app/widgets/hourly_forcast_widget.dart';

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
      children: [
        CurrentWeatherWidget(currentWeather: currentWeather),
        SizedBox(height: 30),
        Text(
          "Forecast",
          style: AppTextStyles.regular16.copyWith(color: AppColors.dark),
        ),
        SizedBox(height: 10),
        HourlyForcastWidget(
          hourly: hourly,
          date: currentWeather.dateTime,
          description: currentWeather.description,
        ),
        SizedBox(height: 30),
        DailyFarcastWidget(daily: daily),
        SizedBox(height: 10),
        Text(
          "Calender",
          style: AppTextStyles.regular16.copyWith(color: AppColors.dark),
        ),
        SizedBox(height: 10),
        CalenderWidget(currentWeather: currentWeather),
      ],
    );
  }
}
