class Weather {
  final String cityName;
  final double temperature;
  final String description;
  final int humidity;
  final double windSpeed;
  final int sunrise;
  final int sunset;

  Weather(
      {
        required this.cityName,
        required this.description,
        required this.humidity,
        required this.sunrise,
        required this.sunset,
        required this.temperature,
        required this.windSpeed,
      }
      );
  factory Weather.fromjson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      description: json['weather'][0]['description'], // <-- fixed here
      humidity: json['main']['humidity'],
      sunrise: json['sys']['sunrise'],
      sunset: json['sys']['sunset'],
      temperature: json['main']['temp'], // Kelvin to Celsius
      windSpeed: json['wind']['speed'],
    );
  }
}