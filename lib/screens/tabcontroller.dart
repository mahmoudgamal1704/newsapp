import 'package:flutter/material.dart';
import 'package:newsapp/models/news_response.dart';
import 'package:newsapp/screens/newsitem.dart';
import 'package:newsapp/screens/tabitem.dart';
import 'package:newsapp/shared/items/constants.dart';
import 'package:newsapp/shared/network/remote/apimanager.dart';
import 'package:provider/provider.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../models/providers/mainprovider.dart';
import '../models/source_response.dart';

class TabControllerScreen extends StatefulWidget {
  // const TabControllerScreen({Key? key}) : super(key: key);
  List<Sources> sources;

  String? q;
  String lancode;

  TabControllerScreen(this.sources, this.q, this.lancode);

  @override
  State<TabControllerScreen> createState() => _TabControllerScreenState();
}

class _TabControllerScreenState extends State<TabControllerScreen> {
  int selectedindex = 0;
  List news = [];
  int lastPage = 5; // as more than need to pay
  int curentpage = 1;
  bool lastnews = false;
  bool tabChanged = false;
  final controller = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    tabChanged = true;
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        fetch();
      }
    });
    super.initState();
  }

  Future fetch() async {
    if (curentpage < lastPage) {
      curentpage++;
    }
    NewsResponse newsresp = await ApiManage.getNews(
        widget.sources[selectedindex].id ?? "", widget.q, widget.lancode,
        page: curentpage.toString());
    if (newsresp.articles!.isEmpty || curentpage == lastPage) {
      lastnews = true;
    }
    setState(() {
      news = (news + newsresp.articles!);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<MainProvider>(context);
    return Column(
      children: [
        DefaultTabController(
            length: widget.sources.length,
            child: TabBar(
              onTap: (value) {
                selectedindex = value;
                tabChanged = true;
                curentpage = 1;
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
          future: widget.sources.isNotEmpty
              ? ApiManage.getNews(widget.sources[selectedindex].id ?? "",
                  widget.q, prov.CurrentLangcode)
              : ApiManage.getNews("", "", prov.CurrentLangcode),
          builder: (context, snapshot) {
            CheckAPIdata(snapshot);
            if (tabChanged) {
              news = snapshot.data?.articles ?? [];
              if (news.length > 0) {
                tabChanged = false;
              }
            }
            return Expanded(
              child: ListView.builder(
                controller: controller,
                itemCount: news.length + 1,
                itemBuilder: (context, index) {
                  if (index < news.length) {
                    return NewsItem(news[index]);
                  } else {
                    if (lastnews) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text("No More News"),
                        ),
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                },
              ),
            );
          },
        )
      ],
    );
  }
}
