import 'package:flutter/material.dart';
import 'package:newsapp/models/categorydata.dart';
import 'package:newsapp/screens/catgoriesscreen.dart';
import 'package:newsapp/screens/drawer.dart';

import '../screens/homescreen.dart';

class HomeLayout extends StatefulWidget {
  // const HomeLayout({Key? key}) : super(key: key);
  static String RouteName = 'Home';

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  bool search = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage('assts/images/pattern.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            actions: search
                ? []
                : [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: IconButton(
                        onPressed: () {
                          search = true;
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.search,
                          size: 30,
                        ),
                      ),
                    )
                  ],
            elevation: 0.0,
            backgroundColor: Colors.green,
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                ),
                borderSide: BorderSide(
                  color: Colors.transparent,
                )),
            centerTitle: true,
            title: search
                ? TextFormField(

                    decoration: InputDecoration(
                        hintText:'Enter ur words' ,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            search = false;
                            setState(() {});
                          },
                        ),
                        prefixIconColor: Colors.black,
                        suffixIcon: Icon(Icons.search, size: 28)),
                    style: TextStyle(height: .3),

                  )
                : Text(
                    '${categoryData == null ? "News App" : categoryData!.name}')),
        // drawerEnableOpenDragGesture: true,

        drawer: DrawerWidget(onDrawerSelected),
        body: categoryData == null
            ? CatigoriesScreen(onCategorySelected)
            : HomeScreen(categoryData?.id ?? ""),
      ),
    );
  }

  CategoryData? categoryData = null;

  // void goToCategories(){
  void onDrawerSelected(number) {
    if (number == DrawerWidget.Categoiresnum) {
      categoryData = null;
    } else if (number == DrawerWidget.Settingnum) {}
    setState(() {
      Navigator.pop(context);
    });
  }

  void onCategorySelected(category) {
    categoryData = category;
    setState(() {});
  }
}
