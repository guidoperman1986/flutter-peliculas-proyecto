import 'package:flutter/material.dart';
import 'package:peliculas_proyecto/src/provider/peliculas_provider.dart';
import 'package:peliculas_proyecto/src/utils/widget_mas_vistas.dart';
import 'package:peliculas_proyecto/src/utils/widget_titulo.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Color mainColor = const Color(0xff3C3261);

  @override
  Widget build(BuildContext context) {
    /* print('En cines');
    peliculasProvider.getPeliculasEnCines(); */

    final topRated = Provider.of<PeliculasProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.3,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Peliculas',
          style: new TextStyle(
              color: mainColor,
              fontFamily: 'Arvo',
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Titulo(), TopRated(topRated.peliculas)],
        ),
      ),
    );
  }
}
