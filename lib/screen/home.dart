import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../modal/class.api_parlamentar.dart';
import '../modal/class.politico.dart';

class Home extends StatelessWidget {
  
  const Home({Key? key}) : super(key: key);

  
 
  
  @override
  Widget build(BuildContext context) {

    Politico politico = Politico();

    List<Parlamentar> parlamentars = [];
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<Politico>(builder: (_,politico,___){
        inspect(politico.parlamentars);
        return Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text("ok"),
          ),
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () async {
  
                  
                },
                child: const Text('Buscar'),
              ))
        ],
      );
      },),
    );
  }
}
