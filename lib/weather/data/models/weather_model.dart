import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel {
  WeatherModel(
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  );

  @JsonKey(name: 'coord')
  final Coord coord;

  @JsonKey(name: 'weather')
  final List<WeatherElement> weather;

  @JsonKey(name: 'base')
  final String base;

  @JsonKey(name: 'main')
  final Main main;

  @JsonKey(name: 'visibility')
  final int visibility;

  @JsonKey(name: 'wind')
  final Wind wind;

  @JsonKey(name: 'clouds')
  final Clouds clouds;

  @JsonKey(name: 'dt')
  final int dt;

  @JsonKey(name: 'sys')
  final Sys sys;

  @JsonKey(name: 'timezone')
  final int timezone;

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'cod')
  final int cod;

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}

@JsonSerializable()
class Clouds {
  Clouds(
    this.all,
  );

  @JsonKey(name: 'all')
  final int all;

  factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);

  Map<String, dynamic> toJson() => _$CloudsToJson(this);
}

@JsonSerializable()
class Coord {
  Coord(
    this.lon,
    this.lat,
  );

  @JsonKey(name: 'lon')
  final double lon;

  @JsonKey(name: 'lat')
  final double lat;

  factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);

  Map<String, dynamic> toJson() => _$CoordToJson(this);
}

@JsonSerializable()
class Main {
  Main(
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
  );

  @JsonKey(name: 'temp')
  final double temp;

  @JsonKey(name: 'feels_like')
  final double feelsLike;

  @JsonKey(name: 'temp_min')
  final double tempMin;

  @JsonKey(name: 'temp_max')
  final double tempMax;

  @JsonKey(name: 'pressure')
  final int pressure;

  @JsonKey(name: 'humidity')
  final int humidity;

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);

  Map<String, dynamic> toJson() => _$MainToJson(this);
}

@JsonSerializable()
class Sys {
  Sys(
    this.type,
    this.id,
    this.country,
    this.sunrise,
    this.sunset,
  );

  @JsonKey(name: 'type')
  final int type;

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'country')
  final String country;

  @JsonKey(name: 'sunrise')
  final int sunrise;

  @JsonKey(name: 'sunset')
  final int sunset;

  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);

  Map<String, dynamic> toJson() => _$SysToJson(this);
}

@JsonSerializable()
class WeatherElement {
  WeatherElement(
    this.id,
    this.main,
    this.description,
    this.icon,
  );

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'main')
  final String main;

  @JsonKey(name: 'description')
  final String description;

  @JsonKey(name: 'icon')
  final String icon;

  factory WeatherElement.fromJson(Map<String, dynamic> json) =>
      _$WeatherElementFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherElementToJson(this);
}

@JsonSerializable()
class Wind {
  Wind(
    this.speed,
    this.deg,
  );

  @JsonKey(name: 'speed')
  final double speed;

  @JsonKey(name: 'deg')
  final int deg;

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);

  Map<String, dynamic> toJson() => _$WindToJson(this);
}
