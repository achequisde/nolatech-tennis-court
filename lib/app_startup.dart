import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nolatech_cancha_tennis/app_startup_error.dart';
import 'package:nolatech_cancha_tennis/common/providers/riverpod_app_startup.dart';
import 'package:nolatech_cancha_tennis/features/home/presentation/page_home.dart';

class AppStartup extends ConsumerWidget {
  const AppStartup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appStartupProvider);

    final body = state.when(
      data: (data) {
        // TODO: Reactive
        // return const PageWelcome();
        return const PageHome();
      },
      error: (error, stackTrace) => AppStartupError(
        message: error.toString(),
        onRetry: () => ref.invalidate(appStartupProvider),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );

    return body;
  }
}
