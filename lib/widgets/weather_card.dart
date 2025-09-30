import 'package:flutter/material.dart';
import 'package:weather_app/models/current_weather.dart';
import 'package:weather_app/styles/app_colors.dart';
import 'package:weather_app/styles/app_text_style.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({
    super.key,
    required this.currentWeather,
    required this.street,
  });
  final CurrentWeather currentWeather;
  final String street;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 168,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.clearWhite,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.location_on, color: AppColors.dark),
              Column(
                spacing: 5,
                children: [
                  Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    street,
                    style: AppTextStyles.medium16.copyWith(
                      color: AppColors.dark,
                    ),
                  ),
                  Text(
                    " ${currentWeather.cityName},${currentWeather.country}",
                    style: AppTextStyles.regular14.copyWith(
                      color: AppColors.secondDark,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Image.network(
                "https://openweathermap.org/img/wn/${currentWeather.icon}@2x.png",
                width: 34,
                height: 32,
              ),
              Text(
                "${currentWeather.temperature.toInt()} °",
                style: AppTextStyles.regular20.copyWith(
                  color: AppColors.dark,
                ),
              ),
            ],
          ),
    
          Text(
            "ــــــــــــــــــــــــــــــــــــــــــــــــــــ",
            style: TextStyle(color: AppColors.secondDark),
          ),
          Row(
            children: [
              Column(
                children: [
                  Text(
                    "Longitude and Latitude",
                    style: AppTextStyles.regular12.copyWith(
                      color: AppColors.secondDark,
                    ),
                  ),
                  Text(
                    "${currentWeather.lon},${currentWeather.lat}",
                    style: AppTextStyles.regular14.copyWith(
                      color: AppColors.dark,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Column(
                children: [
                  Text(
                    "Wind",
                    style: AppTextStyles.regular12.copyWith(
                      color: AppColors.secondDark,
                    ),
                  ),
                  Text("${currentWeather.windSpeed} mp/h")
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
