import 'package:flutter/material.dart';
import 'package:weather_app/models/current_weather.dart';
import 'package:weather_app/styles/app_colors.dart';
import 'package:weather_app/styles/app_text_style.dart';
import 'package:weather_app/widgets/search_text_field.dart';
import 'package:weather_app/widgets/show_map_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.currentWeather});
  final CurrentWeather? currentWeather;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

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
      body: Column(
        spacing: 5,
        children: [
          SearchTextField(searchController: searchController),
          Expanded(
            child: ShowMapWidget(currentWeather: widget.currentWeather!),
          ),
        ],
      ),
    );
  }
}
