import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nolatech_cancha_tennis/common/presentation/court_available_message.dart';

class HomeCourtsCard extends StatelessWidget {
  const HomeCourtsCard({super.key});

  @override
  Widget build(BuildContext context) {
    const title = "Epic Box";
    const type = "Cancha tipo A";
    const rainChance = 30;

    const date = "9 de julio 2024";
    const available = true;

    final availableTime = ["7:00 am", "4:00 pm"];

    final reserveBtn = FilledButton.tonal(
      onPressed: () {
        Navigator.pushNamed(context, "/booking");
      },
      style: FilledButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        backgroundColor: const Color(0xFF82BC00),
        foregroundColor: const Color(0xFFFCFCFC),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 12,
        ),
        child: Text("Reservar"),
      ),
    );

    return Card.outlined(
      child: IntrinsicWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset("assets/home/Enmascarar grupo 7.png"),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      title,
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    const Text(
                      type,
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                    const Gap(8),
                    const Text.rich(
                      TextSpan(
                        children: [
                          WidgetSpan(
                              child: Icon(
                            Icons.calendar_today,
                            size: 14,
                          )),
                          TextSpan(text: " $date"),
                        ],
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                    const Gap(8),
                    const DefaultTextStyle(
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.black,
                      ),
                      child: CourtAvailableMessage(available: true),
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.center,
                      child: reserveBtn,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
