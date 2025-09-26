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
  final double lon;
  final double lat;

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
    required this.lat,
    required this.lon,
  });

  factory CurrentWeather.fromMap(Map<String, dynamic> map) {
    return CurrentWeather(
      cityName: map["name"] ?? "",
      country: map["sys"]?["country"] ?? "",
      temperature: (map["main"]["temp"] as num).toDouble(),
      feelsLike: (map["main"]["feels_like"] as num).toDouble(),
      minTemp: (map["main"]["temp_min"] as num).toDouble(),
      maxTemp: (map["main"]["temp_max"] as num).toDouble(),
      humidity: map["main"]["humidity"] as int,
      pressure: map["main"]["pressure"] as int,
      windSpeed: (map["wind"]["speed"] as num).toDouble(),
      windDeg: map["wind"]["deg"] as int,
      description: map["weather"][0]["description"],
      icon: map["weather"][0]["icon"],
      dateTime: DateTime.fromMillisecondsSinceEpoch(map["dt"] * 1000),
      lat: map["coord"]["lat"],
      lon: map["coord"]["lat"],
    );
  }
}
