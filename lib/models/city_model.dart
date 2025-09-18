class CityModel {
  final String name;
  final double lat;
  final double lon;
  final String country;

  CityModel({
    required this.name,
    required this.lat,
    required this.lon,
    required this.country,
  });

  factory CityModel.fromMap(Map<String, dynamic> map) {
    return CityModel(
      name: map['name'] ?? "",
      lat: (map['lat'] as num).toDouble(),
      lon: (map['lon'] as num).toDouble(),
      country: map['country'] ?? "",
    );
  }
}
