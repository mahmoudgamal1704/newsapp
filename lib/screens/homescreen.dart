import 'package:flutter/material.dart';
import 'package:newsapp/screens/tabcontroller.dart';

import '../models/source_response.dart';
import '../shared/items/constants.dart';
import '../shared/network/remote/apimanager.dart';

class HomeScreen extends StatelessWidget {
  // const HomeScreen({Key? key}) : super(key: key);
  String CategoryID;


  HomeScreen(this.CategoryID);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse>(
      future: ApiManage.getSources(CategoryID),
      builder: (context, snapshot) {
        CheckAPIdata(snapshot);
        var sources = snapshot.data?.sources ?? [];
        return TabControllerScreen(sources);
      },
    );
  }
}
