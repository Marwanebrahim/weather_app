import 'package:flutter/material.dart';
import 'package:weather_app/models/current_weather.dart';
import 'package:weather_app/styles/app_colors.dart';
import 'package:weather_app/styles/app_text_style.dart';

class CurrentWeatherWidget extends StatelessWidget {
  const CurrentWeatherWidget({super.key, required this.currentWeather});
  final CurrentWeather currentWeather;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        height: 205,
        width: 324,
        decoration: BoxDecoration(
          gradient: AppColors.blue,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  currentWeather.description,
                  style: AppTextStyles.bold24.copyWith(
                    color: AppColors.clearWhite,
                  ),
                ),Spacer(),
                Image.network(
                  "https://openweathermap.org/img/wn/${currentWeather.icon}@2x.png",
                  width: 78,
                  height: 73,
                ),
              ],
            ),

            Row(
              spacing: 7,
              children: [
                Icon(Icons.location_on_sharp, color: AppColors.clearWhite),
                Text(
                  " ${currentWeather.cityName},${currentWeather.country}",
                  style: AppTextStyles.regular14.copyWith(
                    color: AppColors.clearWhite,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "${currentWeather.temperature.toInt()} °",
                  style: AppTextStyles.bold24.copyWith(
                    color: AppColors.clearWhite,
                  ),
                ),
                SizedBox(width: 15),
                Icon(
                  Icons.water_drop_outlined,
                  size: 20,
                  color: AppColors.clearWhite,
                ),
                Text(
                  "${currentWeather.humidity}",
                  style: AppTextStyles.medium14.copyWith(
                    color: AppColors.clearWhite,
                  ),
                ),
                SizedBox(width: 15),
                Text(
                  "${currentWeather.pressure} hPa",
                  style: AppTextStyles.medium14.copyWith(
                    color: AppColors.clearWhite,
                  ),
                ),
                SizedBox(width: 15),
                Icon(Icons.air_outlined, color: AppColors.clearWhite, size: 28),
                Text(
                  "${currentWeather.windSpeed}",
                  style: AppTextStyles.medium16.copyWith(
                    color: AppColors.clearWhite,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
