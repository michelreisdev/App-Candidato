import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../modal/class.politico.dart';

class Home extends StatelessWidget {
  
  const Home({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
      ),
      body: Consumer<Politico>(builder: (_,politico,___){
  
        return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: politico.parlamentars.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: (){
                  print(politico.parlamentars[index].nome);
                },
                child: Card(
                  child: SizedBox(
                    height: 100.0,
                    child: Row(
                      children: [
                        Container(
                          height: 100.0,
                          width: 70.0,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              topLeft: Radius.circular(5)
                            ),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(politico.parlamentars[index].urlFoto)
                            )
                          ),
                        ),
                          SizedBox(
                          height: 100,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 2, 0, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text('${politico.parlamentars[index].nome}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('${politico.parlamentars[index].siglaPartido}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 165, 160, 160))),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('${politico.parlamentars[index].siglaUf}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 165, 160, 160))),
                                  ],
                                ),
                                 
                              ],
                            ),
                            ),
                         )
                        
                      ],
                    ),
                  )
                ),
              );
            }
          );
      },),
    );
  }
}