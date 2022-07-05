import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';

class ImgProfile extends StatelessWidget {
  const ImgProfile(this._url, {Key? key}) : super(key: key);

  final String _url;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      height: 130,
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            borderRadius:  BorderRadius.circular(100),
            color: Color.fromARGB(255, 8, 8, 8),
            border: Border.all(
                  width: 5,
                  color: Color.fromARGB(255, 8, 8, 8),
                ),
          ),
          child: ImageNetwork(
            borderRadius: BorderRadius.circular(200),
            image: _url.toString(),
            width: 120,
            height: 120,
            fitAndroidIos: BoxFit.fill,
            fitWeb: BoxFitWeb.contain,
          )
        ),
      ),
    );
  }
}
