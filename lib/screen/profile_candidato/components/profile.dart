import 'package:app_politic/screen/profile_candidato/components/listTile_profile.dart';
import 'package:app_politic/screen/profile_candidato/components/sliverAppBar_background.dart';
import 'package:flutter/material.dart';



class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);
  final bool _pinned = true;
  final bool _snap = false;
  final bool _floating = true;

  @override
  Widget build(BuildContext context) {
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
                   ' parlamentar.nome',
                  ),
                ),
              ),
              background: SilverAppBarBackground(
               '   parlamentar.urlFoto',
                 'sa',
                  '',
                 ''),
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
                    ListTileProfille("Nome", ''),
                    ListTileProfille("Sexo", ''),
                  ],
                ),
                ExpansionTile(
                  title: const Text('Partido'),
                  subtitle: const Text('Dados sobre o partido'),
                  children: <Widget>[
                    ListTileProfille("Nome", ''),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
