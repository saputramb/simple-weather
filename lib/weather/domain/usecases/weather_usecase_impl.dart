import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:simple_weather/weather/common/error/error.dart';
import 'package:simple_weather/weather/data/models/weather_model.dart';
import 'package:simple_weather/weather/domain/repositories/weather_repository.dart';
import 'package:simple_weather/weather/domain/usecases/weather_usecase.dart';

@Injectable(as: WeatherUseCase)
class WeatherUsecaseImpl implements WeatherUseCase {
  final WeatherRepository weatherRepository;

  WeatherUsecaseImpl(this.weatherRepository);

  @override
  Future<Either<Error, WeatherModel>> getWeather({String? lat, String? lon}) =>
      weatherRepository.getWeather(lat: lat, lon: lon);
}
