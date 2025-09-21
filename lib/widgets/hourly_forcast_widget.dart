import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/hourly_forcast_weather.dart';
import 'package:weather_app/styles/app_colors.dart';
import 'package:weather_app/styles/app_text_style.dart';

class HourlyForcastWidget extends StatelessWidget {
  final String description;
  final DateTime date;
  final List<HourlyForcastWeather> hourly;
  const HourlyForcastWidget({
    super.key,
    required this.hourly,
    required this.date,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        width: 343,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: AppColors.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                description,
                style: AppTextStyles.regular14.copyWith(
                  color: AppColors.secondDark,
                ),
              ),
              SizedBox(height: 8),

              Text(
                formattedDate(date),
                style: AppTextStyles.bold16.copyWith(color: AppColors.dark),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  separatorBuilder: (context, index) => SizedBox(width: 16),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Text(
                          formateHour(hourly[index].time, hourly[index].icon),
                          style: AppTextStyles.regular12.copyWith(
                            color: AppColors.secondDark,
                          ),
                        ),

                        Image.network(
                          "https://openweathermap.org/img/wn/${hourly[index].icon}@2x.png",
                          width: 50,
                          height: 50,
                        ),

                        Text(
                          "${hourly[index].tempMax.toInt().toString()} °c",
                          style: AppTextStyles.regular14.copyWith(
                            color: AppColors.dark,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String formattedDate(DateTime date) {
    String mounth = DateFormat('MMMM').format(date);
    String year = DateFormat('y').format(date);
    String day = DateFormat('d').format(date);
    String suffix = _getDaySuffix(int.parse(day));
    return "$mounth $day$suffix $year";
  }

  String _getDaySuffix(int day) {
    if (day >= 11 && day <= 13) return "th";

    switch (day % 10) {
      case 1:
        return "st";
      case 2:
        return "nd";
      case 3:
        return "rd";
      default:
        return "th";
    }
  }

  String formateHour(DateTime time, String icon) {
    int hour = time.hour;

    String suffix = hour >= 12 ? "PM" : "AM";
    int displayHour = hour % 12 == 0 ? 12 : hour % 12;

    return "$displayHour $suffix";
  }
}
