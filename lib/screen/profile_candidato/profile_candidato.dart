import 'dart:developer';

import 'package:app_politic/modal/class_candidato.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../services/api.politico.dart';
import 'components/card_profile.dart';
import 'components/listTile_profile.dart';
import 'components/sliverAppBar_background.dart';

class ProfileCandidato extends StatelessWidget {
  ProfileCandidato(Parlamentar p, {Key? key}) : parlamentar = p;

  final Parlamentar parlamentar;

  var politicoView;
  final bool _pinned = true;
  final bool _snap = false;
  final bool _floating = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<Politico>(
        builder: (_, politico, __) {
          if (politico.loop == 'false') {
            politico.getCandidato(parlamentar.id);
          } else {
            politicoView = politico.canditado['dados'];
          }
          inspect(politico.loop);
          return SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: _pinned,
                  snap: _snap,
                  floating: _floating,
                  expandedHeight: 300.0,
                  flexibleSpace: FlexibleSpaceBar(
                    /* expandedTitleScale: 1.2, */
                    titlePadding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    title: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width / 13,
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(150, 31, 32, 32),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(width: 1)),
                        alignment: Alignment.topCenter,
                        child: Text(
                          parlamentar.nome,
                        ),
                      ),
                    ),
                    background: SilverAppBarBackground(
                        parlamentar.urlFoto,
                        politicoView?['nomeCivil'],
                        parlamentar.siglaPartido,
                        parlamentar.siglaUf),
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: <Widget>[
                      ExpansionTile(
                        title: const Text('Perfil'),
                        subtitle: const Text('Dados sobre o politico'),
                        children: <Widget>[
                          ListTileProfille("Nome", politicoView?["nomeCivil"]),
                          ListTileProfille("Sexo", politicoView?["sexo"]),
                        ],
                      ),
                      ExpansionTile(
                        title: const Text('Partido'),
                        subtitle: const Text('Dados sobre o partido'),
                        children: <Widget>[
                          ListTileProfille("Nome", politicoView?["nomeCivil"]),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
