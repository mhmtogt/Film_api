import 'package:api_1/api/api.dart';
import 'package:api_1/models/film.dart';
import 'package:api_1/widgets/favorite_film.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/top_radet_film.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {


late Future<List<FilmModel>> favoriFilm;

@override
void initState() {
  super.initState();
  favoriFilm = Api().getFavoriFilm();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(' FILM '),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Favorite Films',
                style: GoogleFonts.aBeeZee(
                  fontSize: 25,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              const favoriteFilm(),
              const SizedBox(
                height: 32,
              ),
              Text(
                'Top radet Films',
                style: GoogleFonts.aBeeZee(
                  fontSize: 25,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              const topRadet(),
              const SizedBox(
                height: 32,
              ),
              Text(
                'Upcoming Films', // yaklaşan filmler
                style: GoogleFonts.aBeeZee(
                  fontSize: 25,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              const topRadet(),
            ],
          ),
        ),
      ),
    );
  }
}
