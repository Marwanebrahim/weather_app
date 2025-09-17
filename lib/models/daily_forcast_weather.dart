class DailyForcastWeather {
  final DateTime dateTime;
  final double minTemp;
  final double maxTemp;
  final String icon;

  DailyForcastWeather({
    required this.dateTime,
    required this.minTemp,
    required this.maxTemp,
    required this.icon,
  });

  factory DailyForcastWeather.fromJson(Map<String, dynamic> json) {
    return DailyForcastWeather(
      dateTime: DateTime.fromMillisecondsSinceEpoch(
        json["dt"] * 1000,
        isUtc: true,
      ),
      minTemp: json["temp"]["min"].toDouble(),
      maxTemp: json["temp"]["max"].toDouble(),
      icon: json["weather"][0]["icon"],
    );
  }
}
