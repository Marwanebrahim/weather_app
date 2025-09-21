import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/daily_forcast_weather.dart';
import 'package:weather_app/styles/app_colors.dart';
import 'package:weather_app/styles/app_text_style.dart';

class DailyFarcastWidget extends StatelessWidget {
  final List<DailyForcastWeather> daily;
  const DailyFarcastWidget({super.key, required this.daily});
  String _getFormattedDay(DateTime day) {
    return DateFormat('EEEE').format(day);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      width: 343,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: AppColors.white,
      ),
      child: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        itemCount: daily.length,
        separatorBuilder: (context, index) => SizedBox(height: 20),
        itemBuilder: (context, index) {
          return Row(
            children: [
              Image.network(
                "https://openweathermap.org/img/wn/${daily[index].icon}@2x.png",
                width: 32,
                height: 30,
              ),
              SizedBox(width: 16),
              Text(
                _getFormattedDay(daily[index].dateTime),
                style: AppTextStyles.regular14.copyWith(color: AppColors.dark),
              ),
              Spacer(),
              Text(
                "${daily[index].maxTemp.toInt()}° / ${daily[index].minTemp.toInt()}°",
                style: AppTextStyles.regular14.copyWith(color: AppColors.dark),
              ),
            ],
          );
        },
      ),
    );
  }
}
