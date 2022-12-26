import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  // const DrawerWidget({Key? key}) : super(key: key);
  Function goToCategories ;

  DrawerWidget(this.goToCategories);
  static int Categoiresnum = 1 ;
  static int  Settingnum = 2 ;
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
                padding: EdgeInsets.all(60),
                color: Colors.green,
                child: Text('News App',style: TextStyle(fontSize: 25,color: Colors.white),)),
            Padding(
              padding: const EdgeInsets.all(16),
              child: InkWell(
                  onTap: () {
                      goToCategories(Categoiresnum);
                  },
                  child: Text('Categories',style: TextStyle(fontSize: 18,color: Colors.black),)),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text('Settings',style: TextStyle(fontSize: 18,color: Colors.black),),
            ),
          ],
        ),
    );
  }
}
