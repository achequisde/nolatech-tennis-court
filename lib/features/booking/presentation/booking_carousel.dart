import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BookingCarousel extends StatelessWidget {
  const BookingCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final carousel = CarouselSlider(
      options: CarouselOptions(
        enableInfiniteScroll: false,
        viewportFraction: 1.0,
        enlargeCenterPage: false,
      ),
      items: [1, 2, 3]
          .map((e) => SizedBox.expand(
                child: Image.asset(
                  "assets/booking/Enmascarar grupo 38.png",
                  fit: BoxFit.fill,
                ),
              ))
          .toList(),
    );
    return carousel;
  }
}
