import 'dart:convert' show jsonDecode, utf8;
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
            'https://dadosabertos.camara.leg.br/api/v2/deputados?itens=25'));

    request.headers.addAll(headers);

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      var jsons = jsonDecode(utf8.decode(response.bodyBytes));
      try{
        parlamentars = jsons['dados'].map((job) => Parlamentar.fromJson(job)).toList();
      }catch(e){
        print('erro');
      }
     
    } else {
       print(response.reasonPhrase);
    }
     notifyListeners();
  }


  getParmentarSanchaer()  {
    List parlamentar = parlamentars.where(
      (item){
        return item.SiglaPartidoParlamentar == 'PT';
      }
     ).toList();

     parlamentars = parlamentar;
    notifyListeners();
  }
}