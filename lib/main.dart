import 'package:curse_db/core/db_service.dart';
import 'package:curse_db/features/auth/auth_screen.dart';
import 'package:curse_db/features/auth/bloc/auth_bloc.dart';
import 'package:curse_db/features/info_db/domain/entity/category.dart';
import 'package:curse_db/features/info_db/domain/entity/cinema.dart';
import 'package:curse_db/features/info_db/domain/entity/film.dart';
import 'package:curse_db/features/info_db/view/bloc/db_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseService db = DatabaseService();
  // await db.addCinema(
  //   Cinema(name: "1", categoryID: 2, address: "Адресс", district: "Приморский"),
  // );
  // final cinemas = await db.getCinemas();
  // final films = await db.addFilm(
  //     Film(
  //       name: 'Название',
  //       purpose: "Учебный",
  //       production: "Россия",
  //       director: "Иванов",
  //       genre: "Документальный",
  //       rentalPrice: 100000,
  //     ),
  //     '1');
  // var filmsList = await db.getFilms("1");
  // await db.removeFilm(1, '1');
  var cinemas = await db.getCinemas();
  var filmsList = await db.getFilms("1");
  var tariffList = await db.getTariffs();
  var sessions = await db.getSessions(1);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => DbBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Colors.blue),
          scaffoldBackgroundColor: Colors.grey.shade50,
        ),
        home: const AuthScreen(),
      ),
    );
  }
}
