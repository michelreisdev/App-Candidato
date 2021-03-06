import 'package:flutter/material.dart';

class SearchDiolog extends StatelessWidget {
  const SearchDiolog(this.initialValueParame);
  final initialValueParame;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 2,
          left: 4,
          right: 4,
          child: Card(
              child: TextFormField(
            initialValue: initialValueParame,
            textInputAction: TextInputAction.search,
            autofocus: true,
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
                prefixIcon: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.grey,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )),
            onFieldSubmitted: (text) {
              Navigator.of(context).pop(text);
            },
          )),
        )
      ],
    );
  }
}
