import 'dart:developer';
import 'package:curse_db/features/info_db/data/model/category_helper.dart';
import 'package:curse_db/features/info_db/data/model/cinema_helper.dart';
import 'package:curse_db/features/info_db/data/model/film_helper.dart';
import 'package:curse_db/features/info_db/data/model/poster_helper.dart';
import 'package:curse_db/features/info_db/data/model/session_helper.dart';
import 'package:curse_db/features/info_db/data/model/tariff_helper.dart';
import 'package:curse_db/features/info_db/domain/entity/cinema.dart';
import 'package:curse_db/features/info_db/domain/entity/film.dart';
import 'package:curse_db/features/info_db/domain/entity/poster.dart';
import 'package:curse_db/features/info_db/domain/entity/session.dart';
import 'package:curse_db/features/info_db/domain/entity/category.dart';
import 'package:curse_db/features/info_db/domain/entity/tariff.dart';
import 'package:curse_db/features/info_db/view/widget/add_tarif.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

enum TableName {
  cinema(name: "cinema"),

  category(name: "category"),

  poster(name: "poster"),

  session(name: "session"),

  film(name: "film"),

  tariff(name: "tariff");

  const TableName({required this.name});

  final String name;
}

class DatabaseService {
  Database? _database;

  Future<Database> get db async => _database ?? (_database = await _init());

  Future<String> get fullPath async {
    const name = 'felicia.db';
    final String path = await getDatabasesPath();

    return join(path, name);
  }

  Future<Database> _init() async {
    try {
      final path = await fullPath;
      var database = await openDatabase(path,
          version: 1, onCreate: create, singleInstance: true);
      return database;
    } catch (e) {
      log(e.toString());
      return await openDatabase(await fullPath,
          version: 1, onCreate: create, singleInstance: true);
    }
  }

  Future<void> create(Database database, int version) async {
    await database.execute(''' CREATE TABLE ${TableName.cinema.name} (
        id_cinema INTEGER PRIMARY KEY,
        name TEXT,
        id_category INTEGER,
        address TEXT,
        district TEXT
      )''');
    await database.execute(''' CREATE TABLE ${TableName.film.name} (
        id_film INTEGER PRIMARY KEY,
        name TEXT,
        purpose TEXT,
        production TEXT,
        director TEXT,
        genre TEXT,
        rental_price INTEGER
      )''');
    await database.execute('''CREATE TABLE ${TableName.session.name} (
        id_session INTEGER PRIMARY KEY,
        id_film INTEGER,
        id_cinema INTEGER,
        free_seats INTEGER,
        date_time TEXT,
        id_tariff INTEGER,
        id_relation INTEGER
      )''');
    await database.execute('''CREATE TABLE ${TableName.poster.name} (
        id_cinema INTEGER,
        id_film INTEGER,
        id_relation INTEGER PRIMARY KEY
      )''');
    await database.execute('''CREATE TABLE ${TableName.category.name} (
        id_category INTEGER PRIMARY KEY,
        capacity INTEGER
      )''');
    await database.execute('''CREATE TABLE ${TableName.tariff.name} (
        id_tariff INTEGER PRIMARY KEY,
        id_category INTEGER,
        id_film INTEGER,
        cost INTEGER
      )''');
  }

  //GENERAL
  Future<List<Cinema>> getCinemas() async {
    Database database = await db;
    try {
      final response = await database.query(TableName.cinema.name);
      List<Cinema> result = List<Cinema>.generate(
          response.length, (index) => CinemaHelper.fromMap(response[index]));
      return result;
    } catch (e) {
      log(e.toString());
    }
    return [];
  }

  //Получение фильмов в определенном кинотеатре
  Future<List<Film>> getFilms(String cinema_name) async {
    Database database = await db;
    try {
      final Cinema cinema = CinemaHelper.fromMap((await database.query(
              TableName.cinema.name,
              where: "name = ?",
              whereArgs: [cinema_name]))
          .first);
      final response = await database.query(
        TableName.poster.name,
        // where: 'id_cinema = ?',
        // whereArgs: [cinema.id],
      );
      List<Film> result = [];
      for (var i = 0; i < response.length; i++) {
        Poster poster = PosterHelper.fromMap(response[i]);
        final Film film = FilmHelper.fromMap((await database.query(
          TableName.film.name,
          where: 'id_film = ?',
          whereArgs: [poster.filmID],
        ))
            .first);
        result.add(film);
      }
      return result;
    } catch (e) {
      log(e.toString());
    }
    return [];
  }

  Future<List<Session>> getSessions(int id) async {
    Database database = await db;
    try {
      final response = await database.query(
        TableName.session.name,
        where: "id_cinema = ?",
        whereArgs: [id],
      );
      List<Session> result = List<Session>.generate(
          response.length, (index) => SessionHelper.fromMap(response[index]));
      return result;
    } catch (e) {
      log(e.toString());
    }
    return [];
  }

  //id - id категории
  Future<Category?> getCategory(int id) async {
    Database database = await db;
    try {
      final Cinema cinema = CinemaHelper.fromMap((await database.query(
        TableName.cinema.name,
        where: "id_cinema = ?",
        whereArgs: [id],
      ))
          .first);
      final response = await database.query(
        TableName.category.name,
        where: "id_category = ?",
        whereArgs: [cinema.categoryID],
      );
      if (response.first.isNotEmpty) {
        final result = CategoryHelper.fromMap(response.first);
        if (result != null) {
          return result as Category;
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<Category>> getCategories() async {
    Database database = await db;
    try {
      final response = await database.query(
        TableName.category.name,
      );
      return List<Category>.generate(
          response.length, (index) => CategoryHelper.fromMap(response[index]));
    } catch (e) {
      log(e.toString());
    }
    return [];
  }

  Future<List<Tariff>> getTariffs() async {
    Database database = await db;
    try {
      final response = await database.query(
        TableName.tariff.name,
      );
      return List<Tariff>.generate(
          response.length, (index) => TariffHelper.fromMap(response[index]));
    } catch (e) {
      log(e.toString());
    }
    return [];
  }

  //ADMIN
  Future<void> addCinema(Cinema cinema) async {
    Database database = await db;
    try {
      final response = await database.insert(
          TableName.cinema.name, CinemaHelper.toMap(cinema));
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> addCategory(Category category) async {
    Database database = await db;
    try {
      final response = await database.insert(
          TableName.category.name, CategoryHelper.toMap(category));
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> addFilm(Film film, String cinema_name) async {
    Database database = await db;
    try {
      final response = await database.insert(
        TableName.film.name,
        FilmHelper.toMap(film),
      );
      film = FilmHelper.fromMap((await database.query(TableName.film.name,
              where: "name = ?", whereArgs: [film.name]))
          .first);
      final Cinema cinema = CinemaHelper.fromMap((await database.query(
              TableName.cinema.name,
              where: "name = ?",
              whereArgs: [cinema_name]))
          .first);
      if (film.id != null && cinema.id != null) {
        final newResponse = await database.insert(
          TableName.poster.name,
          PosterHelper.toMap(
            Poster(
              cinemaID: cinema.id!,
              filmID: film.id!,
            ),
          ),
        );
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> addTariff(Tariff tariff) async {
    Database database = await db;
    try {
      final response = await database.insert(
          TableName.tariff.name, TariffHelper.toMap(tariff));
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> removeFilm(int filmId, String cinema_name) async {
    Database database = await db;
    try {
      final response = await database.delete(
        TableName.film.name,
        where: 'id_film = ?',
        whereArgs: [filmId],
      );
      final Cinema cinema = CinemaHelper.fromMap((await database.query(
              TableName.cinema.name,
              where: "name = ?",
              whereArgs: [cinema_name]))
          .first);
      final resp = await database.delete(
        TableName.poster.name,
        where: "id_cinema = ?",
        whereArgs: [cinema.id],
      );
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> addSession(Session session) async {
    Database database = await db;
    try {
      final response = await database.insert(
        TableName.session.name,
        SessionHelper.toMap(session),
      );
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> updateSession(Session session) async {
    Database database = await db;
    try {
      final response = await database.update(
        TableName.session.name,
        SessionHelper.toMap(session),
        where: 'id_session = ?',
        whereArgs: [session.id],
      );
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> removeSession(int id) async {
    Database database = await db;
    try {
      final resp = await database.delete(
        TableName.session.name,
        where: "id_session = ?",
        whereArgs: [id],
      );
    } catch (e) {
      log(e.toString());
    }
  }
}
