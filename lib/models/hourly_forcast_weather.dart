class HourlyForcastWeather {
  final DateTime time;
  final double tempMax;
  final double tempMin;
  final String icon;
  final String description;
  HourlyForcastWeather({
    required this.description,
    required this.tempMax,
    required this.tempMin,
    required this.time,
    required this.icon,
  });

  factory HourlyForcastWeather.fromMap(Map<String, dynamic> map) {
    return HourlyForcastWeather(
      time: DateTime.fromMillisecondsSinceEpoch(map["dt"] * 1000, isUtc: true),
      tempMax: map["main"]["temp_max"].toDouble(),
      tempMin: map["main"]["temp_min"].toDouble(),
      icon: map["weather"][0]["icon"],
      description: map["weather"][0]["description"],
    );
  }
}
