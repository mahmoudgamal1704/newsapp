import 'package:flutter/material.dart';
import 'package:newsapp/shared/items/constants.dart';
import 'package:newsapp/shared/items/dropdownlist.dart';
import 'package:provider/provider.dart';

import '../models/providers/mainprovider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class SettingScreen extends StatelessWidget {
  // const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<MainProvider>(context);
    return Container(
      child: Column (
        children: [
          Text('${AppLocalizations.of(context)!.langtitle}:'),
          DropDownClass(ItemMap: langMap(context), val: langMap(context)[prov.CurrentLangcode], onChang: prov.ChangeLanguage),


        ],
      ),
    );
  }
}
