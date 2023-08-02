import 'package:api_1/core/extensions/num_extension.dart';
import 'package:flutter/material.dart';

class topRadet extends StatelessWidget {
  const topRadet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: 10, // listeye kaç tane film ayacağını gösterir
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                color: Colors.white,
                height: 200.h,
                width: 150.w,
              ),
            ),
          );
        },
      ),
    );
  }
}


