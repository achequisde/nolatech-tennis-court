import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class PageWelcome extends StatelessWidget {
  const PageWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    final loginBtn = FilledButton(
      onPressed: () {
        Navigator.pushNamed(context, "/login");
      },
      style: FilledButton.styleFrom(
        padding: EdgeInsets.all(15),
      ),
      child: const Text(
        "Iniciar sesión",
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
    final signupBtn = FilledButton.tonal(
      onPressed: () {
        Navigator.pushNamed(context, "/signup");
      },
      style: FilledButton.styleFrom(
        backgroundColor: Color(0x99FFFFFF),
        padding: EdgeInsets.all(15),
      ),
      child: const Text(
        "Registrarme",
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );

    final buttons = [
      loginBtn,
      signupBtn,
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      buttons[0],
                      Gap(20),
                      buttons[1],
                    ],
                  ),
                ),
                const Gap(51),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
