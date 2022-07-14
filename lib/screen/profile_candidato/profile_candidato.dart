import 'dart:developer';
import 'package:app_politic/modal/class_candidato.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../services/api.politico.dart';
import 'components/card_profile.dart';
import 'components/listTile_profile.dart';
import 'components/profile.dart';
import 'components/sliverAppBar_background.dart';

class ProfileCandidato extends StatelessWidget {
  ProfileCandidato(this.parlamentar, {Key? key}) : super(key: key);

  late Parlamentar parlamentar;

  Politico politico = new Politico();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<dynamic>(
            future: politico.getCandidato(parlamentar.id),
            builder: (context, snapshot) {

              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Text('Aperte o botão para iniciar a requisição.');
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return const  Center(
                    child: CircularProgressIndicator(),
                  );
                case ConnectionState.done:
                  if(snapshot.data == 'erro'){
                     return const Text('Erro na chamada...');
                  }else{
                     return const Profile();
                  }
              }
            }),
      ),
    );
  }
}