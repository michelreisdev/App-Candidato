import 'package:flutter/cupertino.dart';
import 'package:image_network/image_network.dart';

class ImgPolitico extends StatelessWidget {

  const ImgPolitico(this.url);

  final url;

  @override
  Widget build(BuildContext context) {
      return Container(
        height: 100.0,
        width: 80.0,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(5),
            topLeft: Radius.circular(5)
          ),
        ),
        child: ImageNetwork(
            image: url.toString(),
            width: 100,
            height: 80,
            fitAndroidIos: BoxFit.cover,
            fitWeb: BoxFitWeb.contain,
            
        ),
      );
  }
}