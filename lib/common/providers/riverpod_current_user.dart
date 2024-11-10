import 'package:nolatech_tennis_court/common/models/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'riverpod_current_user.g.dart';

@Riverpod(keepAlive: true)
class CurrentUser extends _$CurrentUser {
  @override
  User? build() {
    return null;
  }

  void login(User user) {
    state = user;
  }
}
