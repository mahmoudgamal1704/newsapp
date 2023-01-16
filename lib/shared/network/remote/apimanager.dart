import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:newsapp/models/news_response.dart';
import 'package:newsapp/models/source_response.dart';
import 'package:newsapp/shared/items/constants.dart';

class ApiManage {

 static  Future<SourceResponse> getSources(String category,String langcode) async {
      Uri URL = Uri.https(BASE,SourcesEndPoint,{"apiKey" : APIKEY,"category":category,"language":langcode});
     Response response = await http.get(URL);
     var json = jsonDecode(response.body);
      SourceResponse SourcesResp = SourceResponse.fromJson(json);
      return SourcesResp;
   }

   static Future<NewsResponse> getNews(String sourceID,String? q,String langcode,{String page = "1"})  async {
     Uri URL;
     if (q ==null) {
       URL = Uri.https(BASE,NewsEndPoint,{"apiKey" : APIKEY , "sources":sourceID,"language":langcode,"page":page});
     } else {
       URL = Uri.https(BASE,NewsEndPoint,{"apiKey" : APIKEY , "q":q,"language":langcode,"page":page});
     }

        Response newsresponse =await http.get(URL);
        var json=jsonDecode(newsresponse.body);
        NewsResponse NewResp = NewsResponse.fromJson(json);
        return NewResp;
   }
}