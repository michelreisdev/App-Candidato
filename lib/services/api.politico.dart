import 'dart:convert' show jsonDecode, utf8;
import 'dart:developer';
import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../modal/class_candidato.dart';
import 'package:http/http.dart' as http;


class Politico extends ChangeNotifier {

  List<dynamic> parlamentars = [];
  List<dynamic> parlamentarsFilter = [];
  var canditado;


  String _search = '';

  String get search => _search;
  set search(String value){
    _search = value;
    notifyListeners();
  }

  String _loop = 'false';

  String get loop => _loop;
  set loop(String value){
    _loop = value;
    notifyListeners();
  }

  Politico(){
    getCandidatos();
  }

  Future<dynamic> getCandidatos() async {
    var headers = {'Accept': 'application/json'};
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://dadosabertos.camara.leg.br/api/v2/deputados'));

    request.headers.addAll(headers);

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      var jsons = jsonDecode(utf8.decode(response.bodyBytes));
      try{
          parlamentars = jsons['dados'].map((job) => Parlamentar.fromJson(job)).toList();
          parlamentarsFilter.addAll(parlamentars);
      }catch(e){

        inspect(e);
      }
     
    } else {
       print(response.reasonPhrase);
    }
      print("ok");
     notifyListeners();
  }

  getCandidato() async {
    var headers = {'Accept': 'application/json'};
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://dadosabertos.camara.leg.br/api/v2/deputados/92346'));

    request.headers.addAll(headers);

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      var jsons = await jsonDecode(utf8.decode(response.bodyBytes));
  
      try{
          canditado = jsons;
          loop = 'true';
        notifyListeners();
  
      }catch(e){

        /* inspect(e); */
      }
     
    } else {
       print(response.reasonPhrase);
    }
    
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