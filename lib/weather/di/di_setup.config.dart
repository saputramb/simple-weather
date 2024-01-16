// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/datasources/weather_datasource.dart' as _i4;
import '../data/repositories/weather_repository_impl.dart' as _i6;
import '../domain/repositories/weather_repository.dart' as _i5;
import '../domain/usecases/weather_usecase.dart' as _i7;
import '../domain/usecases/weather_usecase_impl.dart' as _i8;
import '../presentation/bloc/weather_bloc.dart' as _i9;
import 'dio_module.dart' as _i10;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final dioModule = _$DioModule();
  gh.singleton<_i3.Dio>(dioModule.dio);
  gh.factory<_i4.WeatherDataSource>(() => _i4.WeatherDataSource(gh<_i3.Dio>()));
  gh.factory<_i5.WeatherRepository>(
      () => _i6.WeatherRepositoryImpl(gh<_i4.WeatherDataSource>()));
  gh.factory<_i7.WeatherUseCase>(
      () => _i8.WeatherUsecaseImpl(gh<_i5.WeatherRepository>()));
  gh.factory<_i9.WeatherBloc>(() => _i9.WeatherBloc(gh<_i7.WeatherUseCase>()));
  return getIt;
}

class _$DioModule extends _i10.DioModule {}
