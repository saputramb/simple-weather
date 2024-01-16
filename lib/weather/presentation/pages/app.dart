// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:weather/weather.dart';

// class App extends StatefulWidget {
//   const App({super.key});

//   @override
//   State<App> createState() => _AppState();
// }

// class _AppState extends State<App> {
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     double? lat;
//     double? lon;
//     String key = '9bafcfe74098336d35e9526fcdeea16b';
//     WeatherFactory wf = WeatherFactory(key);
//     Position? position;
//     String? lokasi;

//     /// Determine the current position of the device.
//     ///
//     /// When the location services are not enabled or permissions
//     /// are denied the `Future` will return an error.
//     Future<Position> _determinePosition() async {
//       bool serviceEnabled;
//       LocationPermission permission;

//       // Test if location services are enabled.
//       serviceEnabled = await Geolocator.isLocationServiceEnabled();
//       if (!serviceEnabled) {
//         // Location services are not enabled don't continue
//         // accessing the position and request users of the
//         // App to enable the location services.
//         return Future.error('Location services are disabled.');
//       }

//       permission = await Geolocator.checkPermission();
//       if (permission == LocationPermission.denied) {
//         permission = await Geolocator.requestPermission();
//         if (permission == LocationPermission.denied) {
//           // Permissions are denied, next time you could try
//           // requesting permissions again (this is also where
//           // Android's shouldShowRequestPermissionRationale
//           // returned true. According to Android guidelines
//           // your App should show an explanatory UI now.
//           return Future.error('Location permissions are denied');
//         }
//       }

//       if (permission == LocationPermission.deniedForever) {
//         // Permissions are denied forever, handle appropriately.
//         return Future.error(
//             'Location permissions are permanently denied, we cannot request permissions.');
//       }

//       // When we reach here, permissions are granted and we can
//       // continue accessing the position of the device.
//       return await Geolocator.getCurrentPosition();
//     }

//     return Scaffold(
//       body: Container(
//         width: size.width,
//         height: size.height,
//         color: Colors.red,
//         child: Column(
//           children: [
//             ElevatedButton(
//               onPressed: () async {
//                 // Weather w = await wf.currentWeatherByCityName('Jakarta');
//                 // print(w.latitude);
//                 // print(position);
//                 setState(() {
//                   _determinePosition();
//                 });
//               },
//               child: const Text('Click 1'),
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 // Weather w = await wf.currentWeatherByCityName('Jakarta');
//                 // print(w.latitude);
//                 // setState(() async {
//                 position = await Geolocator.getCurrentPosition(
//                     desiredAccuracy: LocationAccuracy.high);
//                 // });
//                 print(position);
//                 lat = position!.latitude;
//                 lon = position!.longitude;
//               },
//               child: const Text('Click 2'),
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 Weather w = await wf.currentWeatherByLocation(lat!, lon!);
//                 setState(() {
//                   lokasi = w.country.toString();
//                 });
//                 print(w.areaName);
//               },
//               child: const Text('Click 3'),
//             ),
//             Text(lokasi ?? ''),
//           ],
//         ),
//       ),
//     );
//   }
// }
