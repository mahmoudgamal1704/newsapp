import 'package:flutter/material.dart';
import 'package:newsapp/layout/home_layout.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeLayout.RouteName,
      routes: {
        HomeLayout.RouteName:(context) => HomeLayout(),
      },
    );
  }
}
