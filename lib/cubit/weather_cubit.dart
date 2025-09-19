import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/cubit/weather_state.dart';
import 'package:weather_app/models/city_model.dart';
import 'package:weather_app/models/daily_forcast_weather.dart';
import 'package:weather_app/services/location_service.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherService weatherService;
  final LocationService locationService = LocationService();
  WeatherCubit({required this.weatherService}) : super(IntialState());

  void getWeather(String? cityName) async {
    late double lon;
    late double lat;

    emit(LoadingState());
    try {
      if (cityName == null) {
        final position = await getLocation();
        lon = position.longitude;
        lat = position.latitude;
      } else {
        CityModel? city = await weatherService.getCityModel(cityName);
        if (city != null) {
          lon = city.lon;
          lat = city.lat;
        } else {
          emit(FailedState());
        }
      }

      final current = await weatherService.getCurrentWeather(lat, lon);

      final hourly = await weatherService.getHourlyForcast(lat, lon);
      final daily = DailyForcastWeather.getDailyForcast(hourlyData: hourly);
      emit(
        SuccessState(
          currentWeather: current,
          hourlyForcastWeather: hourly,
          dailyForcastWeather: daily,
          cityName: cityName == null
              ? "My Location"
              : " ${current.cityName},${current.country}",
        ),
      );
    } catch (e) {
      emit(FailedState());
    }
  }

  Future<Position> getLocation() async {
    final position = await locationService.determinePosition();
    return position;
  }
}
