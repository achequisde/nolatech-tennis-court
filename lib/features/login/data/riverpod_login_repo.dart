import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nolatech_tennis_court/features/login/data/login_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'riverpod_login_repo.g.dart';

@riverpod
LoginRepo loginRepo(Ref ref) => SqliteLoginRepo();
