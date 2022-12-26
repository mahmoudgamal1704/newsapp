import 'package:flutter/material.dart';
import 'package:newsapp/models/news_response.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewsItem extends StatelessWidget {
  // const NewsItem({Key? key}) : super(key: key);
    Articles article ;

    NewsItem(this.article);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
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
              child:CachedNetworkImage(
                imageUrl: article.urlToImage??"",
                fit: BoxFit.fill,
                height: 180,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),),
              // Image.network(article.urlToImage??"",height: 180,width: double.infinity,)),
          Text('${article.author}',style: TextStyle(fontSize: 12,color: Colors.grey),),
          Text('${article.title}',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
          Text('${article.publishedAt?.substring(0,10)}',style: TextStyle(fontSize: 14,color: Colors.grey),textAlign: TextAlign.right,),

        ],
      ),
    );
  }
}
