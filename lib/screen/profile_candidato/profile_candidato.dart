import 'package:app_politic/modal/class_candidato.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../services/api.politico.dart';
import 'components/card_profile.dart';
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
            politico.getCandidato();
          } else {
            politicoView = politico.canditado['dados'];
          }

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
                    titlePadding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    title: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width / 13,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(150, 31, 32, 32),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(width: 1)
                        ),
                        alignment: Alignment.topCenter,
                        child: Text(
                          parlamentar.nome,
                        ),
                      ),
                    ),
                    background: SilverAppBarBackground(parlamentar.urlFoto),
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 200,
                            height: 200,
                            child: CardProfile(),
                          ),
                          Container(
                            width: 200,
                            height: 200,
                            child: CardProfile(),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 200,
                            height: 200,
                            child: CardProfile(),
                          ),
                          Container(
                            width: 200,
                            height: 200,
                            child: CardProfile(),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 200,
                            height: 200,
                            child: CardProfile(),
                          ),
                          Container(
                            width: 200,
                            height: 200,
                            child: CardProfile(),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 200,
                            height: 200,
                            child: CardProfile(),
                          ),
                          Container(
                            width: 200,
                            height: 200,
                            child: CardProfile(),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 200,
                            height: 200,
                            child: CardProfile(),
                          ),
                          Container(
                            width: 200,
                            height: 200,
                            child: CardProfile(),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 200,
                            height: 200,
                            child: CardProfile(),
                          ),
                          Container(
                            width: 200,
                            height: 200,
                            child: CardProfile(),
                          )
                        ],
                      ),
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
