import 'package:flutter/material.dart';
import 'package:newsapp/models/news_response.dart';
import 'package:newsapp/screens/newscreen.dart';

class NewLayout extends StatelessWidget {
  // const NewLayout({Key? key}) : super(key: key);
static String RouteName = "New";
  @override
  Widget build(BuildContext context) {
    var articale = ModalRoute.of(context)?.settings.arguments as Articles;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage('assts/images/pattern.png'), fit: BoxFit.cover),
      ),
      child: NewScreen(articale),

    );
  }
}
