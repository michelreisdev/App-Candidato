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
              titlePadding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              title: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width / 13,
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(150, 31, 32, 32),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(width: 1)),
                    alignment: Alignment.topCenter,
                    child: const Text(
                     ' parlamentar.nome',
                    ),
                  ),
                ),
              ),
              background: const SilverAppBarBackground(
               'parlamentar.urlFoto',
                 'sa',
                  '',
                 ''),
            ),
          ),
          SliverFillRemaining(
            child: Column(
              children:  const <Widget>[
                ExpansionTile(

                  title:  Text('Perfil'),
                  subtitle: Text('Dados sobre o politico'),
                  children: <Widget>[
                    ListTileProfille("Nome", ''),
                    ListTileProfille("Sexo", ''),
                  ],
                ),
                ExpansionTile(
                  title: Text('Partido'),
                  subtitle: Text('Dados sobre o partido'),
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
