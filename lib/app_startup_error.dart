import 'package:flutter/material.dart';

class AppStartupError extends StatelessWidget {
  const AppStartupError({
    super.key,
    required this.message,
    required this.onRetry,
  });

  final String message;
  final void Function()? onRetry;

  @override
  Widget build(BuildContext context) {
    final retryButton = FilledButton.tonal(
      onPressed: onRetry,
      child: const Text('Actualizar'),
    );

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text(message),
              retryButton,
            ],
          ),
        ),
      ),
    );
  }
}
