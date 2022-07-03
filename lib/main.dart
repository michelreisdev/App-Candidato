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
           primaryColor: const Color.fromARGB(255, 15, 15, 15),
           scaffoldBackgroundColor: const Color.fromARGB(255, 24, 25, 26),
           appBarTheme: const AppBarTheme(
            elevation: 0,
            color: Color.fromARGB(255, 51, 53, 54),
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      ),
    );
  }
}
