import 'package:flutter/material.dart';
import 'package:newsapp/models/categorydata.dart';

class CategoryItem extends StatelessWidget {
  // const CategoryItem({Key? key}) : super(key: key);
  CategoryData categoryData;
  int index;

  CategoryItem(this.categoryData,this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: categoryData.BGcolor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
          bottomLeft: index.isEven ? Radius.circular(25): Radius.zero,
          bottomRight:index.isOdd ?  Radius.circular(25): Radius.zero,
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10,),
          Image.asset('${categoryData.ImageURL}',height: 100,),
          SizedBox(height: 20,),
          Text('${categoryData.name}',style: TextStyle(color: Colors.white,fontSize: 20),),
        ],
      ),
    );
  }
}

