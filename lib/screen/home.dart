import 'package:flutter/material.dart';
import '../modal/class.politico.dart';

class Home extends StatelessWidget {
  
  const Home({Key? key}) : super(key: key);

 
  
  @override
  Widget build(BuildContext context) {

    final Politico politico = Politico();

    return Scaffold(
      appBar: AppBar(),
      body: Column(
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
                   await politico.getParlamento();
                },
                child: const Text('Buscar'),
              ))
        ],
      ),
    );
  }
}
