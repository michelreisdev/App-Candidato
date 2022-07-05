import 'package:app_politic/screen/candidato/candidato.dart';
import 'package:app_politic/screen/profile_candidato/profile_candidato.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'modal/class_candidato.dart';
import 'services/api.politico.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Politico(),
        lazy: true,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (setting){
          switch(setting.name){
            case '/profile_candidado':
                return MaterialPageRoute(
                 builder: (_) => ProfileCandidato(
                    setting.arguments as Parlamentar
                 ),
                );
            default:
              return MaterialPageRoute(
                builder: (_) => const Candidato(),
              );
          }
        },
        title: 'Candidato ',
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.lightBlue[800],
          fontFamily: GoogleFonts.lato().fontFamily,
          textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            bodyText2: TextStyle(fontSize: 18.0, fontFamily: 'Hind', fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
