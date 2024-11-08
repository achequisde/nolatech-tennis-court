import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nolatech_cancha_tennis/features/home/presentation/home_reservations_card.dart';

class HomeReservations extends StatelessWidget {
  const HomeReservations({super.key});

  @override
  Widget build(BuildContext context) {
    const itemCount = 3;

    final list = SliverList.separated(
      itemCount: itemCount,
      separatorBuilder: (context, index) => const Gap(4),
      itemBuilder: (context, index) => const HomeReservationsCard(
        background: Color.fromARGB(255, 244, 247, 252),
        shape: LinearBorder(),
      ),
    );

    return list;
  }
}
