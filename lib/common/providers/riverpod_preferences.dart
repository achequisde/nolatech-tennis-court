import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'riverpod_preferences.g.dart';

@Riverpod(keepAlive: true)
Future<SharedPreferences> preferences(Ref ref) async =>
    await SharedPreferences.getInstance();
