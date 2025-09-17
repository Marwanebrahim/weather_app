class HourlyForcastWeather {
  final DateTime time;
  final double temperature;
  final String icon;

  HourlyForcastWeather({
    required this.time,
    required this.temperature,
    required this.icon,
  });

  factory HourlyForcastWeather.fromJson(Map<String, dynamic> json) {
    return HourlyForcastWeather(
      time: DateTime.fromMillisecondsSinceEpoch(
        json["dt"] * 1000,
        isUtc: true,
      ),
      temperature: json["main"]["temp"].toDouble(),
      icon: json["weather"][0]["icon"],
    );
  }
}
