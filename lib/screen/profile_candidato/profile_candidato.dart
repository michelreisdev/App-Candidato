import 'dart:developer';

import 'package:app_politic/modal/class_candidato.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/api.politico.dart';

class ProfileCandidato extends StatelessWidget  {

     ProfileCandidato(Parlamentar p, {Key? key}):
      parlamentar = p;

  final Parlamentar parlamentar;



  
  @override
  Widget build(BuildContext context)  {
   
    
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<Politico>(builder: (_,politico,__)  {

        if(politico.loop == 'false'){
            politico.getCandidato();
          
        }else{
            inspect( politico.canditado['dados']  );
        }
        
       
        
      return Text("ds");
    },
      
    ),);
  }
}