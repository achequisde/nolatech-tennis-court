import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';

class BookingForm extends HookWidget {
  const BookingForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(() => GlobalKey<FormBuilderState>());

    const startHour = 7;
    const endHour = 20;

    final dateField = FormBuilderDateTimePicker(
      name: "ho",
      firstDate: DateTime.now(),
      inputType: InputType.date,
      decoration: const InputDecoration(
        labelText: 'Fecha',
        hintText: "09/07/2024",
      ),
    );
    final startTime = FormBuilderDropdown(
      name: "start",
      decoration: const InputDecoration(
        labelText: 'Hora de inicio',
        hintText: "00:00",
      ),
      items: List.generate(
        endHour - startHour,
        (index) => DropdownMenuItem(
          value: index + startHour,
          child: Text('${(index + startHour).toString().padLeft(2, '0')}:00'),
        ),
      ),
    );
    final endTime = FormBuilderDropdown(
      name: "end",
      decoration: const InputDecoration(
        labelText: 'Hora de fin',
        hintText: "00:00",
      ),
      items: List.generate(
        endHour - startHour,
        (index) => DropdownMenuItem(
          value: index + startHour,
          child: Text('${(index + startHour).toString().padLeft(2, '0')}:00'),
        ),
      ),
    );

    final commentField = FormBuilderTextField(
      name: "comment",
      minLines: 5,
      maxLines: 30,
      decoration: const InputDecoration(hintText: 'Agregar un comentario...'),
    );

    final reserveBtn = FilledButton.tonal(
      onPressed: () {},
      style: FilledButton.styleFrom(
        padding: const EdgeInsets.all(16),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        backgroundColor: const Color(0xFF82BC00),
        foregroundColor: const Color(0xFFFCFCFC),
      ),
      child: const Text(
        'Reservar',
        style: TextStyle(
          fontSize: 18,
        ),
      ),
    );

    const titleStyle = TextStyle(
      fontSize: 18.0,
    );
    final form = Theme(
      data: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFEEEFF1),
            ),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintStyle: TextStyle(
            color: Color(0xFF9B9C9D),
            fontWeight: FontWeight.normal,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFEEEFF1),
            ),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
      child: FormBuilder(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Establecer fecha y hora",
              style: titleStyle,
            ),
            const Gap(20),
            dateField,
            const Gap(15),
            Row(
              children: [
                Expanded(child: startTime),
                const Gap(15),
                Expanded(child: endTime),
              ],
            ),
            const Gap(20),
            const Text(
              "Agregar un comentario",
              style: titleStyle,
            ),
            const Gap(20),
            commentField,
            const Gap(40),
            reserveBtn,
          ],
        ),
      ),
    );

    final body = form;

    return body;
  }
}
