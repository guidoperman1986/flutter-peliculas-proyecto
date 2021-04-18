import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas_proyecto/src/models/pelicula_model.dart';
import 'dart:convert';

class PeliculasProvider with ChangeNotifier {
  final _url = 'api.themoviedb.org';
  final _apiKey = '62181466b43f912a7ac67cdaa33b5377';
  String _language = 'es-ES';

  List<Pelicula> _peliculas = [];

  List<Pelicula> get peliculas => _peliculas;

  void setPeliculas(List<Pelicula> peliculas) {
    _peliculas = peliculas;
    notifyListeners();
  }

  Future<List<Pelicula>> traerData(Uri url) async {
    final response = await http.get(url);
    final decodedMovies = json.decode(response.body);

    final peliculas = new Peliculas.fromJsonList(decodedMovies['results']);
    return peliculas.items;
  }

  Future<List<Pelicula>> getPeliculasPopulares() {
    final url = Uri.https(
        _url, '3/movie/popular', {'api_key': _apiKey, 'language': _language});

    final peliculas = traerData(url);

    return peliculas;
  }

  Future<List<Pelicula>> getPeliculasEnCines() async {
    final url = Uri.https(_url, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language});
  }

  /* ++++++++++++++++++++++Provider+++++++++++++++++++++++++++++++++++++++++ */
  PeliculasProvider() {
    this.getPeliculasPopularesConProvider();
  }

  traerDataConProvider(Uri url) async {
    final response = await http.get(url);
    final decodedMovies = json.decode(response.body);

    final peliculas = new Peliculas.fromJsonList(decodedMovies['results']);
    return peliculas.items;
  }

  getPeliculasPopularesConProvider() async {
    final url = Uri.https(
        _url, '3/movie/popular', {'api_key': _apiKey, 'language': _language});

    final peliculas = await traerDataConProvider(url);

    setPeliculas(peliculas);
  }
  /* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */

}
