import 'package:flutter/material.dart';
import 'package:peliculas_proyecto/src/models/pelicula_model.dart';
import 'package:peliculas_proyecto/src/provider/peliculas_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /*  final peliculasProvider = new PeliculasProvider(); */

  final Color mainColor = const Color(0xff3C3261);
  var movies;

  @override
  Widget build(BuildContext context) {
    /* print('En cines');
    peliculasProvider.getPeliculasEnCines(); */

    final peliculas = Provider.of<PeliculasProvider>(context);

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
          children: [
            MovieTitle(mainColor),
            peliculaDetail(peliculas.peliculas)
          ],
        ),
      ),
    );
  }

  Widget peliculasMasVistas() {
    /* return FutureBuilder(
      future: peliculas, //peliculasProvider.getPeliculasPopulares(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          List<Pelicula> peliculas = snapshot.data;
          return peliculaDetail(peliculas);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    ); */
  }

  Widget peliculaDetail(peliculas) {
    var image_url = 'https://image.tmdb.org/t/p/w500/';
    return Expanded(
        child: ListView.builder(
      itemCount: peliculas.length,
      itemBuilder: (context, i) {
        return InkWell(
          onTap: () =>
              Navigator.pushNamed(context, 'detalle', arguments: peliculas[i]),
          child: Row(children: [
            Padding(
              padding: EdgeInsets.all(0.0),
              child: Container(
                margin: EdgeInsets.all(10.0),
                child: Container(
                  width: 100.0,
                  height: 100.0,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey,
                    image: DecorationImage(
                        image:
                            NetworkImage(image_url + peliculas[i].posterPath),
                        fit: BoxFit.cover),
                    boxShadow: [
                      BoxShadow(
                          color: mainColor,
                          blurRadius: 5.0,
                          offset: Offset(2.0, 5.0))
                    ]),
              ),
            ),
            Expanded(
                child: Container(
              margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
              child: Column(
                children: [
                  Text(
                    peliculas[i].title,
                    style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Arvo',
                        fontWeight: FontWeight.bold,
                        color: mainColor),
                  ),
                  Padding(padding: EdgeInsets.all(2.0)),
                  Text(
                    peliculas[i].overview,
                    maxLines: 3,
                    style:
                        TextStyle(color: Color(0xff8785A4), fontFamily: 'Arvo'),
                  )
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ))
          ]),
        );
      },
    ));
  }
}

class MovieTitle extends StatelessWidget {
  final Color mainColor;

  MovieTitle(this.mainColor);

  @override
  Widget build(BuildContext context) {
    return new Padding(
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
