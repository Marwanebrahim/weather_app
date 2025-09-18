import 'package:flutter/material.dart';
import 'package:weather_app/styles/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.page,
      appBar: AppBar(title: Text("data"),),
    );
  }
}