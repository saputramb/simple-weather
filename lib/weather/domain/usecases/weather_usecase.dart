import 'package:dartz/dartz.dart';
import 'package:simple_weather/weather/common/error/error.dart';
// import 'package:wms_v2/src/core/error/failure.dart';
import 'package:simple_weather/weather/data/models/weather_model.dart';

abstract class WeatherUseCase {
  Future<Either<Error, WeatherModel>> getWeather({String? lat, String? lon});
}
