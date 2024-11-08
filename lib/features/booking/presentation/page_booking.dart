import 'package:flutter/material.dart';
import 'package:nolatech_tennis_court/features/booking/presentation/booking_app_bar.dart';
import 'package:nolatech_tennis_court/features/booking/presentation/booking_carousel.dart';
import 'package:nolatech_tennis_court/features/booking/presentation/booking_court_info.dart';
import 'package:nolatech_tennis_court/features/booking/presentation/booking_form.dart';

class PageBooking extends StatelessWidget {
  const PageBooking({super.key});

  @override
  Widget build(BuildContext context) {
    const reserveForm = Column(
      children: [],
    );

    const carousel = BookingCarousel();

    final body = CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: carousel,
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: const BookingCourtInfo(),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            color: const Color(0xFFF4F7FC),
            padding: const EdgeInsets.all(30),
            child: const BookingForm(),
          ),
        )
      ],
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const BookingAppBar(),
      body: body,
    );
  }
}
