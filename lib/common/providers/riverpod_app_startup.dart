import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nolatech_tennis_court/common/providers/riverpod_current_user.dart';
import 'package:nolatech_tennis_court/common/providers/riverpod_db.dart';
import 'package:nolatech_tennis_court/common/providers/riverpod_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'riverpod_app_startup.g.dart';

@Riverpod(keepAlive: true)
Future<void> appStartup(Ref ref) async {
  final dynamic providers = [
    preferencesProvider,
    dbProvider,
  ];

  ref.onDispose(() {
    for (final provider in providers) {
      ref.invalidate(provider);
    }
  });

  await Future.wait(
    [for (final provider in providers) ref.watch(provider.future)],
  );
}
