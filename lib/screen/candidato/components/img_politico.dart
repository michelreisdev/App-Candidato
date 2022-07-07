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
        child: const ImageNetwork(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(6),
              bottomLeft: Radius.circular(5),
            ),
            image:'https://d3ugyf2ht6aenh.cloudfront.net/stores/002/007/282/themes/common/logo-1512487490-1650888813-b7a11699b80f2c22ab3ebbeaf2c4950c1650888813-320-0.png?0',
            width: 100,
            height: 80,
            fitAndroidIos: BoxFit.fill,
            fitWeb: BoxFitWeb.contain,
            
        ),
      );
  }
}