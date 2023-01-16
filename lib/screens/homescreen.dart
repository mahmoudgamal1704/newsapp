import 'package:flutter/material.dart';
import 'package:newsapp/screens/tabcontroller.dart';
import 'package:provider/provider.dart';

import '../models/providers/mainprovider.dart';
import '../models/source_response.dart';
import '../shared/items/constants.dart';
import '../shared/network/remote/apimanager.dart';

class HomeScreen extends StatelessWidget {
  // const HomeScreen({Key? key}) : super(key: key);
  String CategoryID;

  String? q;
  HomeScreen(this.CategoryID,this.q);

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<MainProvider>(context);
    return FutureBuilder<SourceResponse>(
      future: ApiManage.getSources(CategoryID,prov.CurrentLangcode),
      builder: (context, snapshot) {
        CheckAPIdata(snapshot);
        var sources = snapshot.data?.sources ?? [];
        return TabControllerScreen(sources,q,prov.CurrentLangcode);
      },
    );
  }
}
