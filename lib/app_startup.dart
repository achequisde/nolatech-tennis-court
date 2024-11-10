import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nolatech_tennis_court/app_startup_error.dart';
import 'package:nolatech_tennis_court/common/providers/riverpod_app_startup.dart';
import 'package:nolatech_tennis_court/common/providers/riverpod_current_user.dart';
import 'package:nolatech_tennis_court/features/home/presentation/page_home.dart';
import 'package:nolatech_tennis_court/features/login/presentation/page_welcome.dart';

class AppStartup extends ConsumerWidget {
  const AppStartup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appStartupProvider);

    final body = state.when(
      data: (data) {
        if (ref.read(currentUserProvider) == null) {
          return const PageWelcome();
        } else {
          return const PageHome();
        }
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
