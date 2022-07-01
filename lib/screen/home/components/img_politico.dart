import 'package:flutter/cupertino.dart';

class ImgPolitico extends StatelessWidget {
 
  const ImgPolitico(this.url);

  final url;

  @override
  Widget build(BuildContext context) {
      return Container(
        height: 100.0,
        width: 80.0,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(5),
            topLeft: Radius.circular(5)
          ),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(url)
          )
        ),
      );
  }
}