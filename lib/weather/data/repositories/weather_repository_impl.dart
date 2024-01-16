import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:simple_weather/weather/common/error/error.dart';
import 'package:simple_weather/weather/common/keys/key.dart';
import 'package:simple_weather/weather/data/datasources/weather_datasource.dart';
import 'package:simple_weather/weather/data/models/weather_model.dart';
import 'package:simple_weather/weather/domain/repositories/weather_repository.dart';

@Injectable(as: WeatherRepository)
class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherDataSource weatherDataSource;

  WeatherRepositoryImpl(this.weatherDataSource);

  @override
  Future<Either<Error, WeatherModel>> getWeather(
      {String? lat, String? lon}) async {
    try {
      final result = await weatherDataSource.getWeather(
        lat,
        lon,
        AppKeys.appid,
        AppKeys.lang,
        AppKeys.units,
      );
      return right(result);
    } on DioException catch (exception) {
      switch (exception.type) {
        case DioExceptionType.badResponse:
          return left(
              HttpInternalServerError(exception.response!.data['message']));
        case DioExceptionType.connectionTimeout:
          return left(
              const HttpConnectionError('Failed to connect to the network'));
        case DioExceptionType.connectionError:
          return left(const HttpConnectionError('Network is not available'));
        default:
          return left(const HttpUnknownError('Unknown error'));
      }
    }
  }
}
