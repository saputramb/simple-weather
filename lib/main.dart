import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_weather/weather/di/di_setup.dart';
import 'package:simple_weather/weather/presentation/bloc/weather_bloc.dart';
import 'package:simple_weather/weather/presentation/pages/apps.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Test Skill',
      home: BlocProvider(
        create: (_) => getIt<WeatherBloc>(),
        child: const Apps(),
      ),
    );
  }
}
