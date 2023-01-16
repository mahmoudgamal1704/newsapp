import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/models/news_response.dart';
import 'package:url_launcher/url_launcher.dart';

class NewScreen extends StatefulWidget {
  // const NewScreen({Key? key}) : super(key: key);
  Articles article;

  NewScreen(this.article);

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {

  @override
  Widget build(BuildContext context) {
    final Uri url = Uri.parse(widget.article.url ?? "");
    Future llaunchUrl() async {
      if (!await launchUrl(url)) {
        throw 'Could not launch $url';
      }
    }
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
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
          title: Text(
            widget.article.title ?? "",
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: CachedNetworkImage(
                imageUrl: widget.article.urlToImage ?? "",
                fit: BoxFit.fill,
                height: 180,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Text(
              '${widget.article.author}',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            Text(
              '${widget.article.title}',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              '${widget.article.publishedAt?.substring(0, 10)}',
              style: TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.right,
            ),
            Text(
              '${widget.article.content}',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            TextButton(onPressed: llaunchUrl, child: Text("view article"))
          ],
        ),
      ),
    );
  }
}
