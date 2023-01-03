import 'package:flutter/material.dart';

class CategoryData {
  String name;
  String id;
  Color BGcolor;
  String ImageURL;
  CategoryData(this.id, this.name, this.BGcolor, this.ImageURL);
  static List<CategoryData> getCategoryData() {
    return [
      CategoryData("sports", "Sports", Color.fromRGBO(201, 28, 34, 1.0),
          "assts/images/ball.png"),
      CategoryData("general", "General", Color.fromRGBO(0, 62, 144, 1.0),
          "assts/images/Politics.png"),
      CategoryData("health", "Health", Color.fromRGBO(237, 30, 121, 1.0),
          "assts/images/health.png"),
      CategoryData("business", "Business", Color.fromRGBO(207, 126, 72, 1.0),
          "assts/images/bussines.png"),
      CategoryData("entertainment", "Entertainment",
          Color.fromRGBO(72, 130, 207, 1.0), "assts/images/environment.png"),
      CategoryData("science", "Science", Color.fromRGBO(242, 211, 82, 1.0),
          "assts/images/science.png"),
      CategoryData("technology", "Technology", Color.fromRGBO(255, 62, 69, 1.0),
          "assts/images/Politics.png"),
    ];
  }
}