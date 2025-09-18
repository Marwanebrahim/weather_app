import 'package:weather_app/models/current_weather.dart';
import 'package:weather_app/models/daily_forcast_weather.dart';
import 'package:weather_app/models/hourly_forcast_weather.dart';

abstract class WeatherState {}

class IntialState extends WeatherState {}

class LoadingState extends WeatherState {}

class FailedState extends WeatherState {}

class SuccessState extends WeatherState {
  final CurrentWeather currentWeather;
  final List<HourlyForcastWeather> hourlyForcastWeather;
  final List<DailyForcastWeather> dailyForcastWeather;

  SuccessState({
    required this.currentWeather,
    required this.hourlyForcastWeather,
    required this.dailyForcastWeather,
  });
}
