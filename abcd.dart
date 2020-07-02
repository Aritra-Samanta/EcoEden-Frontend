import 'dart:io';
import 'package:path/path.dart';
//import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';


class Resource<T> {
  String url;
  T Function(Response response) parse;

  Resource({this.url,this.parse});
}

class API_KEY extends ChangeNotifier{
  String _apikey = "";

  String get key{
    return _apikey;
  }

  void set_key(newValue){
    _apikey = newValue;
    notifyListeners();
  }
}

class Webservice {

  Future<T> load<T>(Resource<T> resource,String apikey) async {

    print(apikey);
    final response = await http.get(resource.url,);
    if(response.statusCode == 200) {
      return resource.parse(response);
    } else {
      throw Exception('Failed to load data!');
    }
  }

}
