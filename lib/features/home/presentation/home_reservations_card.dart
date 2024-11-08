import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeReservationsCard extends StatelessWidget {
  const HomeReservationsCard({super.key, this.background, this.shape});

  final Color? background;
  final ShapeBorder? shape;

  @override
  Widget build(BuildContext context) {
    const title = "Epic Box";

    const time = "2 horas";
    const price = "\$50";

    const timeAndPrice = IntrinsicHeight(
      child: Row(
        children: [
          Icon(
            Icons.schedule,
            size: 14.0,
          ),
          Gap(10),
          Text(time),
          VerticalDivider(),
          Text(price),
        ],
      ),
    );

    const reservedBy = Text('Reservado por: Andrea Gómez');

    const date = Row(
      children: [
        Icon(Icons.calendar_today, size: 14.0),
        Gap(8),
        Text("6 de julio 2024"),
      ],
    );

    return Card.outlined(
      color: background,
      shape: shape,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 12.0,
            color: Colors.black,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/home/Enmascarar grupo 12.png"),
              const Gap(10),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Gap(10),
                  date,
                  Gap(10),
                  reservedBy,
                  Gap(10),
                  timeAndPrice,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
