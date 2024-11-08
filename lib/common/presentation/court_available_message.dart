import 'package:flutter/material.dart';

class CourtAvailableMessage extends StatelessWidget {
  const CourtAvailableMessage({super.key, required this.available});

  final bool available;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 6,
      children: [
        Text(available ? "Disponible" : "No disponible"),
        const CircleAvatar(
          backgroundColor: Colors.blue,
          radius: 5,
        ),
        const Text.rich(
          TextSpan(
            children: [
              WidgetSpan(
                  child: Icon(
                Icons.schedule,
                size: 14.0,
              )),
              TextSpan(text: " 7:00 am a 4:00 pm"),
            ],
          ),
        )
      ],
    );
  }
}
