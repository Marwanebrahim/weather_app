import 'package:intl/intl.dart';
import 'package:weather_app/models/hourly_forcast_weather.dart';

class DailyForcastWeather {
  final DateTime dateTime;
  final double minTemp;
  final double maxTemp;
  final String icon;

  DailyForcastWeather({
    required this.dateTime,
    required this.minTemp,
    required this.maxTemp,
    required this.icon,
  });

 static Map<String, List<HourlyForcastWeather>> groupByDay(
    List<HourlyForcastWeather> hourlyData,
  ) {
    final Map<String, List<HourlyForcastWeather>> grouped = {};

    for (var item in hourlyData) {
      String day = DateFormat('yyyy-MM-dd').format(item.time);
      if (!grouped.containsKey(day)) {
        grouped[day] = [];
      }
      grouped[day]!.add(item);
    }
    return grouped;
  }

static  List<DailyForcastWeather> getDailyForcast(
   {required List<HourlyForcastWeather> hourlyData,}
  ) {
    final grouped = groupByDay(hourlyData);
    final List<DailyForcastWeather> daily = [];
    grouped.forEach((day, item) {
      double min = item
          .map((e) => e.tempMin)
          .reduce((value, element) => value < element ? value : element);
      double max = item
          .map((e) => e.tempMax)
          .reduce((value, element) => value < element ? value : element);
      String icon = item[item.length ~/ 2].icon;
      daily.add(
        DailyForcastWeather(
          dateTime: item.first.time,
          minTemp: min,
          maxTemp: max,
          icon: icon,
        ),
      );
    });
    return daily;
  }

 
}
