import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:simple_weather/weather/data/models/weather_model.dart';
import 'package:simple_weather/weather/domain/usecases/weather_usecase.dart';
import 'package:simple_weather/weather/common/error/error.dart';

part 'weather_event.dart';
part 'weather_state.dart';
part 'weather_bloc.freezed.dart';

@injectable
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherUseCase weatherUseCase;
  WeatherBloc(this.weatherUseCase) : super(WeatherState.initial()) {
    on<WeatherEvent>((event, emit) async {
      await event.when(
        running: () async {
          bool serviceEnabled;
          LocationPermission permission;

          emit(state.copyWith(isLoading: true, result: none()));

          serviceEnabled = await Geolocator.isLocationServiceEnabled();
          if (!serviceEnabled) {
            return emit(
              state.copyWith(
                isLoading: false,
                result: optionOf(
                  Future.error('Location services are disabled.'),
                ),
              ),
            );
          }

          permission = await Geolocator.checkPermission();
          if (permission == LocationPermission.denied) {
            permission = await Geolocator.requestPermission();
            if (permission == LocationPermission.denied) {
              return emit(
                state.copyWith(
                  isLoading: false,
                  result: optionOf(
                    Future.error('Location permissions are denied'),
                  ),
                ),
              );
            }
          }

          if (permission == LocationPermission.deniedForever) {
            return emit(
              state.copyWith(
                isLoading: false,
                result: optionOf(
                  Future.error(
                      'Location permissions are permanently denied, we cannot request permissions.'),
                ),
              ),
            );
          }

          Position position = await Geolocator.getCurrentPosition();
          final result = await weatherUseCase.getWeather(
            lat: position.latitude.toString(),
            lon: position.longitude.toString(),
          );
          return emit(
            result.fold((Error error) {
              return state.copyWith(
                isLoading: false,
                result: none(),
              );
            }, (WeatherModel res) {
              return state.copyWith(
                isLoading: false,
                result: optionOf(res),
              );
            }),
          );
        },
      );
    });
  }
}
