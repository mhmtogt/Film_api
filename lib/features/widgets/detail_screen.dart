

import 'package:flutter/material.dart';
import 'package:api_1/models/film.dart'; 

class FilmDetailPage extends StatelessWidget {
  final FilmModel film; 

  FilmDetailPage({required this.film});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FİLM DETAİL"), 
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[// bu liste bir widget listesi olduğunu gösterir
            Image.network(film.poster), // Film posterini göster
            Text('Açıklama: ${film.title}'), // Film açıklamasını gösterin
           
          ],
        ),
      ),
    );
  }
}
