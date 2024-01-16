import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_weather/weather/common/colors/colors_constans.dart';
import 'package:simple_weather/weather/presentation/bloc/weather_bloc.dart';

class Apps extends StatelessWidget {
  const Apps({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    context.read<WeatherBloc>().add(const WeatherEvent.running());
    return Scaffold(
      backgroundColor: ColorConstants.gray400,
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state.isLoading) {
            return Center(
              child: CircularProgressIndicator(color: ColorConstants.gray50),
            );
          } else {
            return state.result.fold(
              () => Center(
                child: TextButton(
                  onPressed: () {
                    context
                        .read<WeatherBloc>()
                        .add(const WeatherEvent.running());
                  },
                  child: Text(
                    'Retry',
                    style: TextStyle(
                      fontSize: 16,
                      color: ColorConstants.gray50,
                    ),
                  ),
                ),
              ),
              (res) => Container(
                padding: const EdgeInsets.all(10),
                width: size.width,
                height: size.height,
                color: ColorConstants.gray400,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Kota ${res.name}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorConstants.gray50,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Container(
                      width: 240,
                      height: 240,
                      decoration: BoxDecoration(
                          color: ColorConstants.gray200,
                          borderRadius: BorderRadius.circular(120)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                            'http://openweathermap.org/img/wn/${res.weather[0].icon}@4x.png',
                            scale: 1.5,
                          ),
                          Text(
                            '${res.main.temp}\u00B0C',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: ColorConstants.gray50,
                              fontSize: 44,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    Text(
                      '${res.weather[0].description}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorConstants.gray50,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 80),
                    Container(
                      width: size.width,
                      padding: const EdgeInsets.all(10),
                      // decoration: BoxDecoration(
                      //   color: ColorConstants.gray200,
                      //   borderRadius:
                      //       const BorderRadius.all(Radius.circular(10)),
                      // ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Wind Speed',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: ColorConstants.gray50,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                '${res.wind.speed}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: ColorConstants.gray50,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'Humidity',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: ColorConstants.gray50,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                '${res.main.humidity}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: ColorConstants.gray50,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'Visibility',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: ColorConstants.gray50,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                '${res.visibility}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: ColorConstants.gray50,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'Air Pressure',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: ColorConstants.gray50,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                '${res.main.pressure}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: ColorConstants.gray50,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
