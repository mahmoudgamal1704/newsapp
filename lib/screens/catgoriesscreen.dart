import 'package:flutter/material.dart';
import 'package:newsapp/models/categorydata.dart';
import 'package:newsapp/screens/catigoryitem.dart';

class CatigoriesScreen extends StatelessWidget {
  // const CatigoriesScreen({Key? key}) : super(key: key);
  Function onCategorySelected;

  CatigoriesScreen(this.onCategorySelected);

  @override
  Widget build(BuildContext context) {
    var categories = CategoryData.getCategoryData();
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
      child: Column(
        children: [
          Text(
            'Pick Your Category of Interest :',
            style: TextStyle(color: Color.fromRGBO(79, 90, 105, 1.0)),
          ),
          SizedBox(height: 15,),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 14
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {

                    return InkWell(
                        onTap: () {
                            onCategorySelected(categories[index]);
                        },
                        child: CategoryItem(categories[index], index));
                },),
          )
        ],
      ),
    );
  }
}
