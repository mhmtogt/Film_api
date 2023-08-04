import 'dart:math';

import 'package:api_1/core/extensions/num_extension.dart';
import 'package:api_1/models/film.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class favoriteFilm extends StatelessWidget {
  favoriteFilm({
    super.key,
    required this.films,
  });

  final List<String> _randomUrl = [
    'https://www.indiewire.com/wp-content/uploads/2020/01/Screen-Shot-2020-01-06-at-12.18.19-PM.png',
    'https://3.bp.blogspot.com/_LiACEszK3lE/TFFPkZf6OyI/AAAAAAAAAjY/u76SMWxIfUU/s1600/Picture+6.png',
    'https://static.wixstatic.com/media/ec16eb_761b962c071f4f6882dbae2c07ea1d38~mv2.png/v1/fill/w_640,h_470,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/ec16eb_761b962c071f4f6882dbae2c07ea1d38~mv2.png',
  ];
  final List<FilmModel> films;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: films.length,
      options: CarouselOptions(
        height: 500,
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
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                height: 300.h,
                width: 200.w,
                child: film.Poster != null && film.Poster.isNotEmpty
                    ? Image.network(film.Poster)
                    : CachedNetworkImage(
                        imageUrl: _randomUrl[random.nextInt(_randomUrl.length)],
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            Text(film.Title),
          ],
        );
      },
    );
  }
}
