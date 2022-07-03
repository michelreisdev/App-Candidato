import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../modal/class.politico.dart';
import 'components/img_politico.dart';
import 'components/searchDiolog.dart';

class Home extends StatelessWidget {
  
  const Home({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Consumer<Politico>(builder: (_,politico,__){
            if(politico.search.isEmpty){
              return const Text("Politico");
            }else{
                return LayoutBuilder(builder: (_, constraints){
                  return GestureDetector(
                    child: SizedBox(
                      width: constraints.biggest.width,
                      child: Text(politico.search.toString(), textAlign: TextAlign.center,),
                    ),
                    onTap: ()async{
                      final showdialog = await showDialog<String>(
                      context: context, 
                      builder: (_)=> SearchDiolog(politico.search.toString()));

                      if(showdialog != null){
                        politico.search = showdialog;
                      }
                    },
                  );
              });
          
            }
        }),
        actions: <Widget>[
          Consumer<Politico>(builder: (_,politico,__){
             if(politico.search.isEmpty){
              return IconButton(
                onPressed: () async {
                  final showdialog = await showDialog<String>(
                    context: context, 
                    builder: (_)=>  SearchDiolog(politico.search.toString()));

                  if(showdialog != null){
                    politico.search = showdialog;
                  }
                }, 
                icon:  const Icon(Icons.search)
              );
            }else{
              return IconButton(
                onPressed: () async {
                    politico.search = '';
                }, 
                icon:  const Icon(Icons.close)
              );
            }
          })
        ],
      ),
      body: Consumer<Politico>(builder: (_,politico,___) {
        var politicos = politico.ParmentarSearchs();
        return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: politicos.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: (){
                  print(politicos[index].nome);
                },
                child: Card(
                  child: SizedBox(
                    height: 100.0,
                    child: Row(
                      children: [
                          ImgPolitico(politicos[index].urlFoto),
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
                                    Text('${politicos[index].nome}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Text("${politicos[index].siglaPartido} - ${politicos[index].siglaUf}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 165, 160, 160))),
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