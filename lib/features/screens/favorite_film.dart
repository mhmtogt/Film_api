import 'dart:math';

import 'package:api_1/core/constansts/app_constats.dart';
import 'package:api_1/core/extensions/num_extension.dart';
import 'package:api_1/features/screens/detail_screen.dart';
import 'package:api_1/features/screens/widgets/cached_network.dart';
import 'package:api_1/models/film.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class favoriteFilm extends StatelessWidget {
  const favoriteFilm({
    super.key,
    required this.films,
  });

  final List<FilmModel> films;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: films.length,
      options: CarouselOptions(
        height: 500.h,
        autoPlay: true,
        viewportFraction: 0.55,
        enlargeCenterPage: true, // kartın öne çıkmasını sağlar
        autoPlayCurve: Curves.fastOutSlowIn,
        autoPlayAnimationDuration:
            const Duration(seconds: 2), // kartların geçiş zamanlaması
        pageSnapping: true, // sayfayı bizim yönledirmemizi sağlar
      ),
      itemBuilder: (context, itemIndex, pageViewIndex) {
        final film = films[itemIndex];
        final random = Random();
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FilmDetailPage(film: film),
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: SizedBox(
                  height: 300.h,
                  width: 200.w,
                  child: CachedNetwork(
                    imageUrl: film.poster,
                    randomUrls: AppConstants.randomUrls,
                    random: random,
                  ),
                ),
              ),
            ),
            Text(film.title),
            Text(film.imdbId),
          ],
        );
      },
    );
  }
}
