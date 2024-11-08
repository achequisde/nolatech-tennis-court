import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nolatech_cancha_tennis/features/home/presentation/home_courts_card.dart';

class HomeCourts extends StatelessWidget {
  const HomeCourts({super.key});

  @override
  Widget build(BuildContext context) {
    const itemsCount = 3;

    final courtsList = SliverToBoxAdapter(
      child: Container(
        height: 340,
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 10,
        ),
        child: ListView.separated(
          itemCount: itemsCount,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => const Gap(12),
          itemBuilder: (context, index) => const HomeCourtsCard(),
        ),
      ),
    );

    return courtsList;
  }
}
