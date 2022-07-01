import 'dart:convert' show jsonDecode, utf8;
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'class.api_parlamentar.dart';
import 'package:http/http.dart' as http;


class Politico extends ChangeNotifier {

  List<dynamic> parlamentars = [];

  Politico(){
    getParlamento();
  }

  Future<dynamic> getParlamento() async {
    var headers = {'Accept': 'application/json'};
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://legis.senado.leg.br/dadosabertos/senador/lista/atual'));

    request.headers.addAll(headers);

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      var jsons = jsonDecode(utf8.decode(response.bodyBytes));
      try{
        parlamentars = jsons['ListaParlamentarEmExercicio']['Parlamentares']['Parlamentar'].map((job) => Parlamentar.fromJson(job)).toList();
      }catch(e){
        inspect(e);
      }
     
    } else {
       inspect(response.reasonPhrase);
    }
     notifyListeners();
  }
}
