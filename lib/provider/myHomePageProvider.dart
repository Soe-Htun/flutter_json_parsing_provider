import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:json_parsing_provider/model/myData.dart';

class MyHomePageProvider extends ChangeNotifier{
  myData data;

  Future getData(context) async{
    var response = await DefaultAssetBundle.of(context).loadString('assets/raw/mJson.json');
    var mJson = json.decode(response);
    this.data = myData.fromJson(mJson);
    this.notifyListeners();
  }
}