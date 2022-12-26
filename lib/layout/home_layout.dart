import 'package:flutter/material.dart';
import 'package:newsapp/models/source_response.dart';
import 'package:newsapp/shared/items/constants.dart';
import 'package:newsapp/shared/network/remote/apimanager.dart';

class HomeLayout extends StatelessWidget {
  // const HomeLayout({Key? key}) : super(key: key);
  static String RouteName = 'Home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: FutureBuilder<SourceResponse>(
        future: ApiManage.getSources(),
        builder: ( context,  snapshot) {
          CheckAPIdata(snapshot);
          var sources = snapshot.data?.sources??[];
          return ListView.builder(
              itemCount: sources.length,
              itemBuilder: (context, index) {
                  return Text(' ${sources[index].name??""}');
              },);

        },
      ),
    );
  }
}
