import 'package:api_1/api/api.dart';
import 'package:api_1/core/extensions/num_extension.dart';
import 'package:api_1/features/widgets/favorite_film.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/top_radet_film.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(' FILM '),
        centerTitle: true,
      ),
      body: FutureBuilder(future: Api().getFavoriFilm(),

        builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          return SingleChildScrollView(
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
                   favoriteFilm(films: snapshot.data??[]),// data gelmiş null ise boş liste geç
                   SizedBox(
                    height: 32.h,
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
                    'Upcoming Films', 
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
          );
        }
        return const SizedBox.shrink(); //data da yoksa bir şey olmadığı için boş dönecek 
      }),
    );
  }
}
