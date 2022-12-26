import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:newsapp/models/source_response.dart';
import 'package:newsapp/shared/items/constants.dart';

class ApiManage {

 static  Future<SourceResponse> getSources() async {
      Uri URL = Uri.https(BASE,SourcesEndPoint,{"apiKey" : APIKEY});
     Response response = await http.get(URL);
     var json = jsonDecode(response.body);
      SourceResponse SourcesResp = SourceResponse.fromJson(json);
      return SourcesResp;
   }
}