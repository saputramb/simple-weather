import 'package:dartz/dartz.dart';
import 'package:simple_weather/weather/common/error/error.dart';
import 'package:simple_weather/weather/data/models/weather_model.dart';

abstract class WeatherRepository {
  Future<Either<Error, WeatherModel>> getWeather({String? lat, String? lon});
}
