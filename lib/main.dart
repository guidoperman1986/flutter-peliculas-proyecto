import 'package:flutter/material.dart';
import 'package:peliculas_proyecto/src/pages/busqueda.dart';
import 'package:peliculas_proyecto/src/pages/home_page.dart';
import 'package:peliculas_proyecto/src/pages/peliculas_detail.dart';
import 'package:peliculas_proyecto/src/provider/peliculas_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => PeliculasProvider())],
      child: MaterialApp(
          title: 'Material App',
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (_) => HomePage(),
            'busqueda': (_) => BusquedaPage(),
            'detalle': (_) => DetailPage()
          }),
    );
  }
}
