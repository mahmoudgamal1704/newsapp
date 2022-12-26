import 'package:flutter/material.dart';
import 'package:newsapp/models/news_response.dart';
import 'package:newsapp/screens/newsitem.dart';
import 'package:newsapp/screens/tabitem.dart';
import 'package:newsapp/shared/items/constants.dart';
import 'package:newsapp/shared/network/remote/apimanager.dart';

import '../models/source_response.dart';

class TabControllerScreen extends StatefulWidget {
  // const TabControllerScreen({Key? key}) : super(key: key);
  List<Sources> sources;

  TabControllerScreen(this.sources);

  @override
  State<TabControllerScreen> createState() => _TabControllerScreenState();
}

class _TabControllerScreenState extends State<TabControllerScreen> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: widget.sources.length,
            child: TabBar(
              onTap: (value) {
                selectedindex = value;
                setState(() {});
              },
              indicatorColor: Colors.transparent,
              isScrollable: true,
              tabs: widget.sources
                  .map((source) => Tab(
                        child: TabItem(source,
                            widget.sources.indexOf(source) == selectedindex),
                      ))
                  .toList(),
            )),
        FutureBuilder<NewsResponse>(
            future:widget.sources.isNotEmpty ? ApiManage.getNews(widget.sources[selectedindex].id??""): ApiManage.getNews(""),
            builder: (context, snapshot) {
              CheckAPIdata(snapshot);
              var news = snapshot.data?.articles??[];
              return Expanded(
                child: ListView.builder(
                    itemCount: news.length,
                    itemBuilder: (context, index) {
                      return NewsItem(news[index]);
                    },),
              );
            },)
      ],
    );
  }
}
