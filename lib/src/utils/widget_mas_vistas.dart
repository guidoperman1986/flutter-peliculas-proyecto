import 'package:flutter/material.dart';

class TopRated extends StatelessWidget {
  final peliculas;
  final Color mainColor = const Color(0xff3C3261);

  const TopRated(this.peliculas);

  @override
  Widget build(BuildContext context) {
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
