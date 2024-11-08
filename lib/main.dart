import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nolatech_cancha_tennis/app_startup.dart';
import 'package:nolatech_cancha_tennis/features/booking/presentation/page_booking.dart';
import 'package:nolatech_cancha_tennis/features/login/presentation/page_login.dart';
import 'package:nolatech_cancha_tennis/features/login/presentation/page_signup.dart';

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