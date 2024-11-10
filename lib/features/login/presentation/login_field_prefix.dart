import 'package:flutter/material.dart';

class LoginFieldPrefix extends StatelessWidget {
  const LoginFieldPrefix({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 14.0,
        ),
        SizedBox(
          height: 14,
          width: 14,
          child: VerticalDivider(
            width: 10,
          ),
        ),
      ],
    );
  }
}
