import 'package:curse_db/features/info_db/view/widget/add_cinema.dart';
import 'package:curse_db/features/info_db/view/widget/add_film.dart';
import 'package:curse_db/features/info_db/view/widget/add_session.dart';
import 'package:curse_db/features/info_db/view/widget/remove_film.dart';
import 'package:flutter/material.dart';

import 'widget/add_category.dart';
import 'widget/add_tarif.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Добавление кинотеатра",
            style: TextStyle(
                color: Colors.black87,
                fontSize: 24.0,
                fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: AddCinema(),
          ),
          SizedBox(
            height: 24.0,
          ),
          const Text(
            "Добавление фильма в прокат в кинотеатре",
            style: TextStyle(
                color: Colors.black87,
                fontSize: 24.0,
                fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: AddFilm(),
          ),
          SizedBox(
            height: 24.0,
          ),
          const Text(
            "Удаление фильма из проката",
            style: TextStyle(
                color: Colors.black87,
                fontSize: 24.0,
                fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: RemoveCinema(),
          ),
          SizedBox(
            height: 24.0,
          ),
          const Text(
            "Добавление новой категории",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 24.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: AddCategoryWidget(),
          ),
          SizedBox(
            height: 24.0,
          ),
          const Text(
            "Добавление тарифа",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 24.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: AddTariffWidget(),
          ),
          SizedBox(
            height: 24.0,
          ),
          const Text(
            "Добавление сессии",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 24.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: AddSessionWidget(),
          ),
        ],
      ),
    );
  }
}
