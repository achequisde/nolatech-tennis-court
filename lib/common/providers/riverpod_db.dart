import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'riverpod_db.g.dart';

@Riverpod(keepAlive: true)
Future<Database> db(Ref ref) async {
  final db = await openDatabase(
    join(await getDatabasesPath(), "tennis_court.db"),
    version: 1,
    onCreate: (db, version) async {
      final tablesToCreate = [
        [
          "court",
          "id INTEGER PRIMARY KEY AUTOINCREMENT",
          "name TEXT NOT NULL",
          "type TEXT NOT NULL",
          "address TEXT NOT NULL",
          "price REAL NOT NULL",
          "start_hour INTEGER NOT NULL",
          "end_hour INTEGER NOT NULL",
        ],
        [
          "user",
          "id INTEGER PRIMARY KEY AUTOINCREMENT",
          "name TEXT NOT NULL",
          "email TEXT NOT NULL UNIQUE",
          "phone TEXT NOT NULL",
          "password TEXT NOT NULL",
        ],
        [
          "reservation",
          "id INTEGER PRIMARY KEY AUTOINCREMENT",
          "reservation_court INTEGER NOT NULL",
          "reservation_user INTEGER NOT NULL",
          "FOREIGN KEY(reservation_court) REFERENCES court(id)",
          "FOREIGN KEY(reservation_user) REFERENCES user(id)",
        ],
        [
          "favorite",
          "id INTEGER PRIMARY KEY AUTOINCREMENT",
          "favorite_court INTEGER NOT NULL",
          "favorite_user INTEGER NOT NULL",
          "FOREIGN KEY(favorite_court) REFERENCES court(id)",
          "FOREIGN KEY(favorite_user) REFERENCES user(id)",
        ],
      ];

      for (final table in tablesToCreate) {
        final sqlCommand =
            "CREATE TABLE IF NOT EXISTS ${table[0]} (${table.sublist(1).join(",")});";
        await db.execute(sqlCommand);
      }

      await db.execute('''
        INSERT INTO court(name, type, address, price, start_hour, end_hour) 
        VALUES('Epic Box', 'A', 'Avenida Caracas', 7.5, 7, 19);
      ''');

      await db.execute('''
        INSERT INTO court(name, type, address, price, start_hour, end_hour) 
        VALUES('Epic Box', 'A', 'Carrera Avila', 7.5, 7, 19);
      ''');
    },
  );

  return db;
}
