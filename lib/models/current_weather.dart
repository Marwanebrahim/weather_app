class CurrentWeather {
  final String cityName; //
  final String country; //
  final double temperature; //
  final int humidity; //
  final int pressure; //
  final double windSpeed; //
  final String description; //
  final String icon; //
  final double feelsLike;
  final double minTemp;
  final double maxTemp;
  final int windDeg;
  final DateTime dateTime;

  CurrentWeather({
    required this.cityName,
    required this.country,
    required this.temperature,
    required this.feelsLike,
    required this.minTemp,
    required this.maxTemp,
    required this.humidity,
    required this.pressure,
    required this.windSpeed,
    required this.windDeg,
    required this.description,
    required this.icon,
    required this.dateTime,
  });

  factory CurrentWeather.fromMap(Map<String, dynamic> json) {
    return CurrentWeather(
      cityName: json["name"] ?? "",
      country: json["sys"]?["country"] ?? "",
      temperature: (json["main"]["temp"] as num).toDouble(),
      feelsLike: (json["main"]["feels_like"] as num).toDouble(),
      minTemp: (json["main"]["temp_min"] as num).toDouble(),
      maxTemp: (json["main"]["temp_max"] as num).toDouble(),
      humidity: json["main"]["humidity"] as int,
      pressure: json["main"]["pressure"] as int,
      windSpeed: (json["wind"]["speed"] as num).toDouble(),
      windDeg: json["wind"]["deg"] as int,
      description: json["weather"][0]["description"],
      icon: json["weather"][0]["icon"],
      dateTime: DateTime.fromMillisecondsSinceEpoch(json["dt"] * 1000),
    );
  }
}
