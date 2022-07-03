import 'package:app_politic/screen/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'modal/class.politico.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> Politico(),
        lazy: false,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (setting){
          switch(setting.name){
            default:
              return MaterialPageRoute(
                builder: (_) => const Home(),
              );
          }
        },
        title: 'Candidato ',
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.lightBlue[800],
          fontFamily: 'Georgia',
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
