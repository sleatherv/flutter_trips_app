import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trips_app/platzi_trips.dart';
import 'package:trips_app/platzi_trips_cupertino.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const Center(
      //   child: Text('Hello'),
      // ),
      // home: const PlatziTrips()
      home: const PlatziTripsCupertino(),
    );
  }
}
