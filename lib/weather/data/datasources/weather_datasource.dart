import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:simple_weather/weather/data/models/weather_model.dart';

part 'weather_datasource.g.dart';

@RestApi()
@injectable
abstract class WeatherDataSource {
  @factoryMethod
  factory WeatherDataSource(Dio dio) = _WeatherDataSource;

  @GET('/data/2.5/weather')
  Future<WeatherModel> getWeather(
    @Query('lat') String? lat,
    @Query('lon') String? lon,
    @Query('appid') String? appid,
    @Query('lang') String? lang,
    @Query('units') String? units,
  );
}
