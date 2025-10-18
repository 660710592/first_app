import 'package:first_app/AirQualityApi.dart';
import 'package:first_app/Form/form_input.dart';
import 'package:first_app/Navigation/first_page.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/material.dart';
import 'package:first_app/Form/form_example.dart';
import 'package:first_app/AirQualityApi.dart';
import 'package:first_app/week5/ApiExample.dart';
import 'package:first_app/week5/ApiExamplelist.dart';
import 'package:first_app/week5/Assigment.dart';
import 'package:first_app/Week6/components/Page/simple_custom_widget.dart';
import 'package:first_app/Week6/components/Page/animation_page.dart';
import 'package:first_app/Week6/components/Assigment/traffic_light_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      //initialRoute: '/',
      //routes: {
      // '/': (context) => const FirstPage(),
      // '/second': (context) => const SecondPage(),
      // '/counter': (context) => const CounterWidget(),
      //},
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.black)),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.blue),
      ),
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.blueGrey[900],
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
        appBarTheme: AppBarTheme(backgroundColor: Colors.grey[800]),
      ),
      themeMode: ThemeMode.light,
      home: TrafficLightPage(),
    );
  }
}

/*class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First App'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}*/
