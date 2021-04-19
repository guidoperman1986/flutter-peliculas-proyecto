import 'package:flutter/material.dart';

class Titulo extends StatelessWidget {
  final Color mainColor = const Color(0xff3C3261);

  MovieTitle(mainColor) {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      child: Text(
        'Mas Vistas',
        style: TextStyle(
            fontSize: 40.0,
            color: mainColor,
            fontWeight: FontWeight.bold,
            fontFamily: 'Arvo'),
        textAlign: TextAlign.left,
      ),
    );
  }
}
