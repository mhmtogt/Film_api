import 'package:api_1/core/extensions/num_extension.dart';
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
        return Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                height: 300.h,
                width: 200.w,
                child: Image.network(film.Poster),
              ),
            ),
                Text(film.Title),

          ],
        );
      },
    );
  }
}
