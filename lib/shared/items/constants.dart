



import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
const String BASE = 'newsapi.org';
const String APIKEY = 'e38cafe64cb54ff69650e9019a6abc7f';

const String SourcesEndPoint = '/v2/top-headlines/sources';

const String NewsEndPoint = '/v2/everything';
 Map langMap(BuildContext context) {
return {
'en' :AppLocalizations.of(context)?.en,
'ar' : AppLocalizations.of(context)?.ar,

};
}
// const Map langMap = {
//   "en" : "English",
//   "ar" : "Arabic"
// };

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