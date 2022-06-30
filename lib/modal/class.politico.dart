import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'class.api_parlamentar.dart';
import 'package:http/http.dart' as http;

class Politico extends ChangeNotifier {
  List<Parlamentar> parlamentars = [];

  

  Future<void> getParlamento() async {
    var headers = {'Accept': 'application/json'};
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://legis.senado.leg.br/dadosabertos/senador/lista/atual'));

    request.headers.addAll(headers);

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      /* var jsons =   json.decode( response.body.toString() );
      var parlamentarress = jsons['ListaParlamentarEmExercicio']['Parlamentares']['Parlamentar']; */
       //inspect(parlamentarress[0]['IdentificacaoParlamentar']);
      
      try{
    
      }catch(e){
        inspect(e);
      }
     
     
      
    } else {
       inspect(response.reasonPhrase);
    }
  }
}
