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

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      cityName: json["name"],
      temperature: (json["main"]["temp"] as num).toDouble(),
      description: json["weather"][0]["description"],
      icon: json["weather"][0]["icon"],
      feelsLike: (json["main"]["feels_like"] as num).toDouble(),
      humidity: json["main"]["humidity"],
      windSpeed: (json["wind"]["speed"] as num).toDouble(),
      pressure: json["main"]["pressure"],
      sunrise: DateTime.fromMillisecondsSinceEpoch(
        json["sys"]["sunrise"] * 1000,
      ),
      sunset: DateTime.fromMillisecondsSinceEpoch(json["sys"]["sunset"] * 1000),
    );
  }
}
