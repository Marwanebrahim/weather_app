import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/helpers/asset_helper.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/styles/app_colors.dart';
import 'package:weather_app/styles/app_text_style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _asyncMethod();
  }

  Future<void> _asyncMethod() async {
    await Future.delayed(Duration(seconds: 2));
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                WeatherCubit(weatherService: WeatherService(dio: Dio()))
                  ..getWeather(null),
            child: HomeScreen(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: AppColors.blue),
        child: Column(
          // spacing: 11,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetHelper.cloud),
            Text(
              "Cloudy",
              style: AppTextStyles.bold34.copyWith(color: AppColors.clearWhite),
            ),
            SizedBox(height: 10),
            Text(
              "     Dont worry about \nthe weather we all here",
              style: AppTextStyles.regular16.copyWith(
                color: AppColors.clearWhite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
