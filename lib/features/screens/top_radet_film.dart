import 'dart:math';

import 'package:api_1/core/extensions/num_extension.dart';
import 'package:api_1/models/film.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class topRadet extends StatelessWidget {
  const topRadet({
    super.key,
    required this.radets,
  });

  final List<FilmModel> radets;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: radets.length,
        options: CarouselOptions(
          height: 500.h,
          autoPlay: true,
          viewportFraction: 0.55,
          enlargeCenterPage: true, // kartın öne çıkmasını sağlar
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration:
              const Duration(seconds: 2), // kartların geçiş zamanlaması
          pageSnapping: true,
        ),




        itemBuilder: (context, itemIndex, pageViewIndex) {
          final film = radets[itemIndex];
          final random = Random();
          return Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: SizedBox(
                  height: 300.h,
                  width: 200.w,
                  child: CachedNetworkImage(
                    imageUrl: film.poster,
                    errorWidget: (context, url, error) {
                      return const SizedBox(
                      );
                    },


                    fit: BoxFit.cover,
                  ),
                ),
              ),  

              
              Text(film.title),
              Text(film.imdbId),
            ],
          );
        }
        );
  }
}
