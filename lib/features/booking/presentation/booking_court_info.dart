import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gap/gap.dart';
import 'package:nolatech_tennis_court/common/presentation/court_available_message.dart';

class BookingCourtInfo extends StatelessWidget {
  const BookingCourtInfo({super.key});

  @override
  Widget build(BuildContext context) {
    const firstLineStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
    );

    final selectedField = FormBuilderDropdown(
      name: "hola",
      decoration: const InputDecoration(
        labelText: 'Agregar instructor',
        border: OutlineInputBorder(),
      ),
      items: const [
        DropdownMenuItem(
          value: "mark_gonzalez",
          child: Text("Mark Gonzalez"),
        ),
      ],
    );

    final courtInfo = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          "Epic Box",
          style: firstLineStyle,
        ),
        const Gap(4),
        const Text("Cancha tipo A"),
        const Gap(10),
        const CourtAvailableMessage(available: true),
        const Gap(10),
        const Text("Vía Av. Caracas y Av. P. Caroní"),
        const Gap(20),
        selectedField,
      ],
    );

    final priceAndWeather = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "\$25",
          style: firstLineStyle.copyWith(
            color: const Color(0xFF346BC3),
          ),
        ),
        const Gap(4),
        Text(
          "Por hora",
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: const Color(0xFF9B9C9D),
              ),
        ),
        const Gap(4),
        const Text("30%"),
      ],
    );

    final body = DefaultTextStyle(
      style: Theme.of(context).textTheme.bodySmall!,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 3, child: courtInfo),
          Expanded(child: priceAndWeather),
        ],
      ),
    );

    return body;
  }
}
