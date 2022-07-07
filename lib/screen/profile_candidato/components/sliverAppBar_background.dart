import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';

import 'imgProfile.dart';

class SilverAppBarBackground extends StatelessWidget {
  const SilverAppBarBackground(this.url, this.nomeCivil, this.siglaPartido, this.siglaUf);

  final url;
  final nomeCivil;
  final siglaPartido;
  final siglaUf;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.8,
          child: ClipRRect(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: ImageNetwork(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                image:
                    'https://i.pinimg.com/564x/4f/2c/57/4f2c572b49856ddf62b336b20db71f49.jpg',
                fitAndroidIos: BoxFit.contain,
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 140.0),
              child: ImgProfile(url),
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child:  Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 100),
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 1, color: Colors.black),
                  color: const Color.fromARGB(100, 0, 0, 0),
                ),
                child:  Padding(
                   padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: SizedBox(
                    height: 35,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('${nomeCivil ??  '...' }', style: TextStyle(fontSize: 18),),
                        Text('${siglaPartido  ??  '' } - ${siglaUf  ??  '' }', style: TextStyle(fontSize: 12),),
                      ],
                    ),
                  ),
                )),
            ),
          ),
        ),
      ],
    );
  }
}
