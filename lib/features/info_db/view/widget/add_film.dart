import 'package:curse_db/core/widget/button_container.dart';
import 'package:curse_db/core/widget/input_container.dart';
import 'package:curse_db/features/info_db/domain/entity/film.dart';
import 'package:curse_db/features/info_db/view/bloc/db_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilmController {
  final TextEditingController name = TextEditingController();
  final TextEditingController purpose = TextEditingController();
  final TextEditingController production = TextEditingController();
  final TextEditingController director = TextEditingController();
  final TextEditingController genre = TextEditingController();
  final TextEditingController rentalPrice = TextEditingController();
}

class AddFilm extends StatelessWidget {
  FilmController filmController = FilmController();
  TextEditingController cinemaName = TextEditingController();
  AddFilm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InputContainer(
          controller: filmController.name,
          hint: 'Название',
        ),
        InputContainer(
          controller: filmController.purpose,
          hint: 'Предназначение',
        ),
        InputContainer(
          controller: filmController.production,
          hint: 'Производство',
        ),
        InputContainer(
          controller: filmController.director,
          hint: 'Режиссер',
        ),
        InputContainer(
          controller: filmController.genre,
          hint: 'Жанр',
        ),
        InputContainer(
          controller: filmController.rentalPrice,
          hint: 'Прокатная стоимость',
        ),
        InputContainer(
          controller: cinemaName,
          hint: 'Название кинотеатра',
        ),
        ButtonContainer(
          title: "Удалить фильм из проката",
          onTap: () {
            BlocProvider.of<DbBloc>(context).add(
              AddFilmEvent(
                cinemaName.text,
                film: Film(
                  name: filmController.name.text.trim(),
                  purpose: filmController.purpose.text.trim(),
                  production: filmController.production.text.trim(),
                  director: filmController.director.text.trim(),
                  genre: filmController.genre.text.trim(),
                  rentalPrice: int.parse(
                    filmController.rentalPrice.text.trim(),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
