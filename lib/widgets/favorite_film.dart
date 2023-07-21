import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class favoriteFilm extends StatelessWidget {
  const favoriteFilm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: 10,
        options: CarouselOptions(
          height: 300,
          autoPlay: true,
          viewportFraction: 0.55,
          enlargeCenterPage: true, // kartın öne çıkmasını sağlar
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration:
              const Duration(seconds: 2), // kartların geçiş zamanlaması
          pageSnapping: true, // sayfayı bizim yönledirmemizi sağlar
        ),
        itemBuilder: (context, itemIdeX, pageViewIndeX) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              height: 300,
              width: 200,
              color: Colors.white,
            ),
          );
        },
      ),
    );
  }
}