part of 'weather_bloc.dart';

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState({
    @Default(false) bool isLoading,
    required Option<dynamic> result,
  }) = _WeatherState;

  factory WeatherState.initial() => WeatherState(result: none());
}
