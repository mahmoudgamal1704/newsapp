import 'package:flutter/material.dart';
import 'package:newsapp/layout/New_layout.dart';
import 'package:newsapp/layout/home_layout.dart';
import 'package:newsapp/shared/items/constants.dart';
import 'package:provider/provider.dart';
import 'models/providers/mainprovider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp( ChangeNotifierProvider(create: (BuildContext context)=> MainProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<MainProvider>(context);
    return MaterialApp(

      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale(langMap(context).keys.toList()[0]), // English, no country code
        Locale(langMap(context).keys.toList()[1]), // Arabic, no country code
      ],
      locale: Locale(prov.CurrentLangcode),
      initialRoute: HomeLayout.RouteName,
      routes: {
        HomeLayout.RouteName:(context) => HomeLayout(),
        NewLayout.RouteName:(context) => NewLayout(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
