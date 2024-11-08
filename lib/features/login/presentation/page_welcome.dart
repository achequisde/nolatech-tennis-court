import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class PageWelcome extends StatelessWidget {
  const PageWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    final loginBtn = FilledButton.tonal(
      onPressed: () {
        Navigator.pushNamed(context, "/login");
      },
      child: const Text("Iniciar sesión"),
    );
    final signupBtn = FilledButton.tonal(
      onPressed: () {
        Navigator.pushNamed(context, "/signup");
      },
      child: const Text("Registrarme"),
    );

    final buttons = [
      loginBtn,
      signupBtn,
    ];

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/login/Grupo 20.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  const Gap(90),
                  SvgPicture.asset("assets/login/LOGO.svg"),
                  const Spacer(),
                  ...buttons,
                  const Gap(51),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
