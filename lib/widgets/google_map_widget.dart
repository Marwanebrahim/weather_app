import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/models/current_weather.dart';
import 'package:weather_app/widgets/search_text_field.dart';
import 'package:weather_app/widgets/show_map_widget.dart';

class GoogleMapWidget extends StatefulWidget {
  const GoogleMapWidget({super.key,required this.currentWeather});
  final CurrentWeather? currentWeather;

  @override
  State<GoogleMapWidget> createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      children: [
        SearchTextField(
          searchController: searchController,
          onPressed: () {
            context.read<WeatherCubit>().getWeather(searchController.text);
          },
        ),
        Expanded(child: ShowMapWidget(currentWeather: widget.currentWeather!)),
      ],
    );
  }
}
