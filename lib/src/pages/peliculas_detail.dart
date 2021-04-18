import 'package:flutter/material.dart';
import 'package:peliculas_proyecto/src/models/pelicula_model.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Pelicula pelicula = ModalRoute.of(context).settings.arguments;
    var image_url = 'https://image.tmdb.org/t/p/w500/';

    final Color mainColor = const Color(0xff3C3261);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.3,
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: mainColor),
        title: Text(
          pelicula.title,
          style: new TextStyle(
              color: mainColor,
              fontFamily: 'Arvo',
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
          /* margin: EdgeInsets.all(20.0),
          alignment: Alignment.topLeft, */
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  image_url + pelicula.posterPath,
                  height: 300.0,
                  alignment: Alignment.center,
                )
              ],
            ),
            Container(
              padding: EdgeInsets.all(15.0),
              child: Text(
                pelicula.overview,
                textAlign: TextAlign.center,
              ),
            )
          ]),
    );
  }
}
