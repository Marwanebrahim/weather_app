import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/cubit/weather_state.dart';
import 'package:weather_app/models/current_weather.dart';
import 'package:weather_app/styles/app_colors.dart';
import 'package:weather_app/styles/app_text_style.dart';
import 'package:weather_app/widgets/google_map_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.currentWeather});
  final CurrentWeather? currentWeather;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.page,
        title: Text(
          widget.currentWeather == null ? "Add City" : "Search",
          style: AppTextStyles.medium16.copyWith(color: AppColors.dark),
        ),
      ),
      backgroundColor: AppColors.page,
      body: BlocProvider.value(
        value: context.read<WeatherCubit>()..getWeather(),
        child: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (BuildContext context, WeatherState state) {
            if (state is LoadingState) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is SuccessState) {
              return GoogleMapWidget(currentWeather: state.currentWeather);
            }
            return Text("");
          },
        ),
      ),
    );
  }
}
