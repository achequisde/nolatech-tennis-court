import 'package:nolatech_tennis_court/common/providers/riverpod_app_startup.dart';
import 'package:nolatech_tennis_court/common/providers/riverpod_current_user.dart';
import 'package:nolatech_tennis_court/common/providers/riverpod_db.dart';
import 'package:nolatech_tennis_court/features/login/data/riverpod_login_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'riverpod_login.g.dart';

@riverpod
class Login extends _$Login {
  @override
  FutureOr<void> build() async {}

  Future<void> login(String email, String password) async {
    final db = ref.read(dbProvider).requireValue;
    final loginRepo = ref.read(loginRepoProvider);

    final old = state;
    state = const AsyncLoading();
    await loginRepo.login(db, email, password).then(
      (value) {
        ref.read(currentUserProvider.notifier).login(value);
      },
    );

    ref.invalidate(appStartupProvider);

    state = old;
  }

  Future<void> signup(
    String name,
    String email,
    String phone,
    String password,
  ) async {
    final db = ref.read(dbProvider).requireValue;
    final loginRepo = ref.read(loginRepoProvider);

    final old = state;
    state = const AsyncLoading();
    await loginRepo.signup(db, name, email, phone, password).then(
      (value) {
        ref.read(currentUserProvider.notifier).login(value);
      },
    );

    state = old;
  }
}
