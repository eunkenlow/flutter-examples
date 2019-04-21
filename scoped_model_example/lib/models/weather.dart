class Weather {
  final String name;
  final String description;
  final String icon;
  final double temperature;
  final double wind;

  Weather({
    this.name,
    this.description,
    this.icon,
    this.temperature,
    this.wind,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      name: json['weather'][0]['main'],
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
      temperature: json['main']['temp'],
      wind: json['wind']['speed'],
    );
  }

  factory Weather.empty() {
    return Weather(
      name: '',
      description: '',
      icon: '',
      temperature: 0,
      wind: 0,
    );
  }
}
