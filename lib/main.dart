import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nolatech_tennis_court/app_startup.dart';
import 'package:nolatech_tennis_court/features/booking/presentation/page_booking.dart';
import 'package:nolatech_tennis_court/features/login/presentation/page_login.dart';
import 'package:nolatech_tennis_court/features/login/presentation/page_signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portones',
      theme: ThemeData(
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: const Color(0xFF82BC00),
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            foregroundColor: Colors.white,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const AppStartup(),
      routes: {
        "/login": (context) => const PageLogin(),
        "/signup": (context) => const PageSignup(),
        "/booking": (context) => const PageBooking(),
      },
    );
  }
}
