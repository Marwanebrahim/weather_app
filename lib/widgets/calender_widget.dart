import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:weather_app/models/current_weather.dart';
import 'package:weather_app/styles/app_colors.dart';
import 'package:weather_app/styles/app_text_style.dart';

class CalenderWidget extends StatelessWidget {
  final CurrentWeather currentWeather;
  const CalenderWidget({super.key, required this.currentWeather});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      height: 430,
      width: 343,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: AppColors.white,
      ),

      child: Column(
        children: [
          Row(
            children: [
              Image.network(
                "https://openweathermap.org/img/wn/${currentWeather.icon}@2x.png",
                width: 60,
                height: 60,
              ),
              SizedBox(width: 8,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currentWeather.description,
                    style: AppTextStyles.regular14.copyWith(
                      color: AppColors.dark,
                    ),
                  ),
                  Text(
                    "${currentWeather.temperature.toInt().toString()} °c",
                    style: AppTextStyles.bold20.copyWith(color: AppColors.dark),
                  ),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat("MMM").format(currentWeather.dateTime),
                    style: AppTextStyles.regular14.copyWith(
                      color: AppColors.dark,
                    ),
                  ),
                  Text(
                    DateFormat("yyyy").format(currentWeather.dateTime),
                    style: AppTextStyles.bold20.copyWith(color: AppColors.dark),
                  ),
                ],
              ),
            ],
          ),
          TableCalendar(
            focusedDay: currentWeather.dateTime,
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                gradient: AppColors.blue,
                shape: BoxShape.circle,
              ),
              todayTextStyle: AppTextStyles.regular12.copyWith(
                color: AppColors.clearWhite,
              ),
              defaultTextStyle: AppTextStyles.regular12.copyWith(
                color: AppColors.dark,
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
          ),
        ],
      ),
    );
  }
}
