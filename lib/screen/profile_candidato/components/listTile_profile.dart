import 'package:flutter/material.dart';

class ListTileProfille extends StatelessWidget {
  const ListTileProfille(this.title, this.subtitle);

  final title;
  final subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text('subtitle.toString()'),
    );
  }
}