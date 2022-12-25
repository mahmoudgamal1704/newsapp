import 'package:flutter/material.dart';

class HomeLayout extends StatelessWidget {
  // const HomeLayout({Key? key}) : super(key: key);
  static String RouteName = 'Home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
    );
  }
}
