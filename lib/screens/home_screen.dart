import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/cubit/weather_state.dart';
import 'package:weather_app/styles/app_colors.dart';
import 'package:weather_app/styles/app_text_style.dart';
import 'package:weather_app/widgets/weather_list_viev.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.page,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.page,
        title: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is SuccessState) {
              return Text(
                state.cityName,
                style: AppTextStyles.medium16.copyWith(color: AppColors.dark),
              );
            }
            return Text(
              "Weather App",
              style: AppTextStyles.medium16.copyWith(color: AppColors.dark),
            );
          },
        ),
      ),

      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is FailedState) {
            return Center(
              child: Text(
                "Please Check the connection of the internet or make the position service on",
                style: AppTextStyles.medium16.copyWith(color: AppColors.dark),
              ),
            );
          }

          if (state is SuccessState) {
            return WeatherListViev(
              currentWeather: state.currentWeather,
              hourly: state.hourlyForcastWeather,
              daily: state.dailyForcastWeather,
            );
          }
          return Text("unknown state");
        },
      ),
    );
  }
}
