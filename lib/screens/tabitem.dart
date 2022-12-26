import 'package:flutter/material.dart';
import 'package:newsapp/models/source_response.dart';

class TabItem extends StatelessWidget {
  // const TabItem({Key? key}) : super(key: key);
  Sources sources ;
  bool isSelected ;

  TabItem(this.sources,this.isSelected);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 7),
      decoration: BoxDecoration(
        color: isSelected ? Colors.green : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.green)
      ),
      child: Text(sources.name??"",style: TextStyle(fontSize: 16,color: isSelected ? Colors.white:Colors.green),),
    );
  }
}
