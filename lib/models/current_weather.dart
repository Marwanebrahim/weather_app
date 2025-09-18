class CurrentWeather {
  final String cityName;
  final double temperature;
  final String description;
  final String icon;
  final double feelsLike;
  final int humidity;
  final double windSpeed;
  final int pressure;
  final DateTime sunrise;
  final DateTime sunset;

  CurrentWeather({
    required this.cityName,
    required this.temperature,
    required this.description,
    required this.icon,
    required this.feelsLike,
    required this.humidity,
    required this.windSpeed,
    required this.pressure,
    required this.sunrise,
    required this.sunset,
  });

  factory CurrentWeather.fromMap(Map<String, dynamic> map) {
    return CurrentWeather(
      cityName: map["name"],
      temperature: (map["main"]["temp"] as num).toDouble(),
      description: map["weather"][0]["description"],
      icon: map["weather"][0]["icon"],
      feelsLike: (map["main"]["feels_like"] as num).toDouble(),
      humidity: map["main"]["humidity"],
      windSpeed: (map["wind"]["speed"] as num).toDouble(),
      pressure: map["main"]["pressure"],
      sunrise: DateTime.fromMillisecondsSinceEpoch(
        map["sys"]["sunrise"] * 1000,
      ),
      sunset: DateTime.fromMillisecondsSinceEpoch(map["sys"]["sunset"] * 1000),
    );
  }
}
