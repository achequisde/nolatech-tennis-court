import 'package:flutter/material.dart';
import 'package:nolatech_tennis_court/common/models/user.dart';
import 'package:sqflite/sqflite.dart';

abstract class LoginRepo {
  Future<User> login(Database db, String email, String password);
  Future<User> signup(
    Database db,
    String name,
    String email,
    String phone,
    String password,
  );
}

class SqliteLoginRepo implements LoginRepo {
  @override
  Future<User> login(Database db, String email, String password) async {
    final query = await db.query("user",
        where: "email = '$email' AND password = '$password'");

    return User.fromJson(
      query[0],
    );
  }

  @override
  Future<User> signup(
    Database db,
    String name,
    String email,
    String phone,
    String password,
  ) async {
    final query = await db.insert(
      "user",
      {
        "name": name,
        "email": email,
        "phone": phone,
        "password": password,
      },
    );

    if (query < 1) {
      throw ErrorDescription("Error when creating new user.");
    }

    return await login(db, email, password);
  }
}
