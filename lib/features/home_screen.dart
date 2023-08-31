import 'package:api_1/api/api.dart';
import 'package:api_1/core/extensions/num_extension.dart';
import 'package:api_1/core/theme/text_styles.dart';
import 'package:api_1/features/screens/favorite_film.dart';
import 'package:flutter/material.dart';

import 'screens/top_radet_film.dart';

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
                    style: context.aBeeZee,
                  ),
                   SizedBox(
                    height: 32.h,
                  ),
                   favoriteFilm(films: snapshot.data??[]),// data gelmiş null ise boş liste geç
                   SizedBox(
                    height: 32.h,
                  ),
                  Text(
                    'Top radet Films',
                    style: context.aBeeZee,
                  ),
                   SizedBox(
                    height: 32.h,
                  ),
                   topRadet(radets: snapshot.data??[]),
                   SizedBox(
                    height: 32.h,
                  ),
                  Text(
                    'Upcoming Films', 
                    style: context.aBeeZee,
                  ),
                   SizedBox(
                    height: 32.h,
                  ),
              //    const topRadet(),
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
