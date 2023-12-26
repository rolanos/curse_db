import 'package:curse_db/core/widget/button_container.dart';
import 'package:curse_db/core/widget/input_container.dart';
import 'package:curse_db/features/info_db/domain/entity/cinema.dart';
import 'package:curse_db/features/info_db/view/bloc/db_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CinemaController {
  final TextEditingController name = TextEditingController();
  final TextEditingController categoryId = TextEditingController();
  final TextEditingController adress = TextEditingController();
  final TextEditingController district = TextEditingController();
}

class AddCinema extends StatelessWidget {
  CinemaController cinemaController = CinemaController();

  AddCinema({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InputContainer(
          controller: cinemaController.name,
          hint: 'Название',
        ),
        InputContainer(
          controller: cinemaController.categoryId,
          hint: 'ID категории',
        ),
        InputContainer(
          controller: cinemaController.adress,
          hint: 'Адрес',
        ),
        InputContainer(
          controller: cinemaController.district,
          hint: 'Район',
        ),
        ButtonContainer(
            title: "Сохранить новый кинотеатр",
            onTap: () {
              BlocProvider.of<DbBloc>(context).add(
                AddCinemaEvent(
                  cinema: Cinema(
                    name: cinemaController.name.text.trim(),
                    categoryID:
                        int.parse(cinemaController.categoryId.text.trim()),
                    address: cinemaController.adress.text.trim(),
                    district: cinemaController.district.text.trim(),
                  ),
                ),
              );
            })
      ],
    );
  }
}
