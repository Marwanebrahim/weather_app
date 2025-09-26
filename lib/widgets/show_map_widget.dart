// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/models/current_weather.dart';
import 'package:weather_app/widgets/weather_card.dart';

class ShowMapWidget extends StatefulWidget {
  const ShowMapWidget({super.key, required this.currentWeather});
  final CurrentWeather currentWeather;

  @override
  State<ShowMapWidget> createState() => _ShowMapWidgetState();
}

class _ShowMapWidgetState extends State<ShowMapWidget> {
  List<Placemark> placemark = [];
  late CurrentWeather mapWeather;
  LatLng? selectedPosition;
  GoogleMapController? mapController;
  String? cityName;
  @override
  void initState() {
    super.initState();
    selectedPosition = LatLng(
      widget.currentWeather.lat,
      widget.currentWeather.lon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: (controller) => mapController = controller,
            initialCameraPosition: CameraPosition(
              target: LatLng(
                widget.currentWeather.lat,
                widget.currentWeather.lon,
              ),
              zoom: 10,
            ),
            onTap: _onMapTap,
            markers: selectedPosition != null
                ? {
                    Marker(
                      markerId: MarkerId("selected"),
                      position: selectedPosition!,
                    ),
                  }
                : {},
          ),
          if (selectedPosition != null && cityName != null)
            WeatherCard(
              currentWeather: widget.currentWeather,
              street: placemark.first.street!,
            ),
        ],
      ),
    );
  }

  void _onMapTap(LatLng position) async {
    setState(() {
      selectedPosition = position;
    });

    placemark = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    if (placemark.isNotEmpty) {
      context.read<WeatherCubit>().getWeather(cityName);
      setState(() {
        cityName = placemark.first.locality ?? placemark.first.country;
      });
    }
  }
}
