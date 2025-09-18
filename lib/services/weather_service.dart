import 'package:dio/dio.dart';
import 'package:weather_app/models/city_model.dart';
import 'package:weather_app/models/current_weather.dart';
import 'package:weather_app/models/hourly_forcast_weather.dart';

class WeatherService {
  final String apiKey = "20e70e24b83f87a13445b5fbc950cd05";
  final Dio dio;

  WeatherService({required this.dio});
  Future<CurrentWeather> getCurrentWeather(double lat, double lon) async {
    final Response response = await dio.get(
      'https://api.openweathermap.org/data/2.5/weather',
      queryParameters: {
        "lat": lat,
        "lon": lon,
        "appid": apiKey,
        "units": "metric",
      },
    );

    return CurrentWeather.fromMap(response.data);
  }

  Future<List<HourlyForcastWeather>> getHourlyForcast(
    double lat,
    double lon,
  ) async {
    final Response response = await dio.get(
      "https://api.openweathermap.org/data/2.5/forecast",
      queryParameters: {
        "lat": lat,
        "lon": lon,
        "appid": apiKey,
        "units": "metric",
      },
    );
    return (response.data["list"] as List)
        .map((e) => HourlyForcastWeather.fromMap(e))
        .toList();
  }

  Future<CurrentWeather?> getWeatherByCity(String cityName) async {
    final city = await getCityModel(cityName);
    if (city == null) {
      return null;
    }

    return await getCurrentWeather(city.lat, city.lon);
  }

  Future<CityModel?> getCityModel(String cityName) async {
    final Response response = await dio.get(
      "http://api.openweathermap.org/geo/1.0/direct",
      queryParameters: {"q": cityName, "limit": 1, "appid": apiKey},
    );

    if ((response.data as List).isEmpty) {
      return null;
    }
    return CityModel.fromMap(response.data[0]);
  }
}
