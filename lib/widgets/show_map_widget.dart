// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/cubit/weather_state.dart';
import 'package:weather_app/models/current_weather.dart';
import 'package:weather_app/widgets/weather_card.dart';

class ShowMapWidget extends StatefulWidget {
  const ShowMapWidget({
    super.key,
    required this.currentWeather,
    required this.cityName,
  });
  final CurrentWeather currentWeather;
  final String? cityName;

  @override
  State<ShowMapWidget> createState() => _ShowMapWidgetState();
}

class _ShowMapWidgetState extends State<ShowMapWidget> {
  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();
  List<Placemark> placemark = [];
  late LatLng selectedPosition;
  String street = "";
  @override
  void initState() {
    super.initState();
    selectedPosition = LatLng(
      widget.currentWeather.lat,
      widget.currentWeather.lon,
    );
    _updatePlaceMark(selectedPosition);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          CurrentWeather currentWeather = widget.currentWeather;
          if (state is SuccessState) {
            currentWeather = state.currentWeather;
          }
          return Stack(
            children: [
              GoogleMap(
                mapType: MapType.normal,
                onMapCreated: (controller) =>
                    mapController.complete(controller),
                initialCameraPosition: CameraPosition(
                  target: selectedPosition,
                  zoom: 12,
                ),
                onTap: _onMapTap,
                markers: {
                  Marker(
                    markerId: MarkerId("selected"),
                    position: selectedPosition,
                  ),
                },
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: WeatherCard(
                  currentWeather: currentWeather,
                  street: street.isNotEmpty ? street : "loading...",
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _onMapTap(LatLng position) async {
    setState(() {
      selectedPosition = position;
    });

    await _updatePlaceMark(position);
    context.read<WeatherCubit>().getWeather(
      lat: position.latitude,
      lon: position.longitude,
    );
  }

  Future<void> _updatePlaceMark(LatLng position) async {
    placemark = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    setState(() {
      street = placemark.isNotEmpty
          ? placemark.first.locality ?? "Unknown"
          : "Unknown";
    });

    final controller = await mapController.future;
    controller.animateCamera(CameraUpdate.newLatLng(position));
  }
}
