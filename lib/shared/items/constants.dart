


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const String BASE = 'newsapi.org';
const String APIKEY = '7bdc9c4aab1143f5ac448443e2f6ec0c';

const String SourcesEndPoint = '/v2/top-headlines/sources';

const String NewsEndPoint = '/v2/everything';

Widget CheckAPIdata (AsyncSnapshot snapshot) {
  if(snapshot.connectionState ==ConnectionState.waiting){
    return CircularProgressIndicator();
  }
  if(snapshot.hasError ) {
    return Text('Error');
  }
  if (snapshot.data?.status != "ok") {
    return Text( '${snapshot.data?.message??"Err"}');
  }
  return Text('data');
}