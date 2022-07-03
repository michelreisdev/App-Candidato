import 'dart:convert' show jsonDecode, utf8;
import 'package:flutter/cupertino.dart';
import 'class.api_parlamentar.dart';
import 'package:http/http.dart' as http;


class Politico extends ChangeNotifier {

  List<dynamic> parlamentars = [];
  List<dynamic> parlamentarsFilter = [];
  String _search = '';

  String get search => _search;
  set search(String value){
    _search = value;
    notifyListeners();
  }

  Politico(){
    getParlamento();
  }

  Future<dynamic> getParlamento() async {
    var headers = {'Accept': 'application/json'};
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://dadosabertos.camara.leg.br/api/v2/deputados?itens=25'));

    request.headers.addAll(headers);

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      var jsons = jsonDecode(utf8.decode(response.bodyBytes));
      try{
          parlamentars = jsons['dados'].map((job) => Parlamentar.fromJson(job)).toList();
          parlamentarsFilter.addAll(parlamentars);
      }catch(e){
        print('erro');
      }
     
    } else {
       print(response.reasonPhrase);
    }
    
     notifyListeners();
  }



  List<dynamic>ParmentarSearchs(){
    parlamentarsFilter = [];
    if(search.isEmpty){
      parlamentarsFilter.addAll(parlamentars);
    }else{
      parlamentarsFilter.addAll( parlamentars.where(
            (item)=> item.nome.toLowerCase().contains(search.toLowerCase())
      ));
    }
    return parlamentarsFilter;
  }
}