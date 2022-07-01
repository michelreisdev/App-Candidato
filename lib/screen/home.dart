import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../modal/class.politico.dart';

class Home extends StatelessWidget {
  
  const Home({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Consumer<Politico>(builder: (_,politico,___){
        inspect(politico.parlamentars);
        return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: politico.parlamentars.length,
            itemBuilder: (BuildContext context, int index) {
              String partido =politico.parlamentars[index].SiglaPartidoParlamentar;
              return Card(
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
                            image: NetworkImage(politico.parlamentars[index].UrlFotoParlamentar)
                          )
                        ),
                      ),
                      SizedBox(
                          height: 100,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 2, 0, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('${politico.parlamentars[index].NomeCompletoParlamentar}'),
                                Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
                                    child: Container(
                                    width: 92,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.teal),
                                      borderRadius: const BorderRadius.all(Radius.circular(10))
                                    ),
                                    child: Text( partido,textAlign: TextAlign.center,),
                                  ),
                                ),
                                const Padding(
                                  padding:  EdgeInsets.fromLTRB(0, 5, 0, 2),
                                    child: SizedBox(
                                    width: 260,
                                    child: Text("__",style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 48, 48, 54)
                                    ),),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                    ],
                  ),
                )
              );
            }
          );
      },),
    );
  }
}