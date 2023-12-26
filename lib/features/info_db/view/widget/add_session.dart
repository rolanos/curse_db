import 'package:curse_db/core/widget/button_container.dart';
import 'package:curse_db/core/widget/input_container.dart';
import 'package:curse_db/features/info_db/domain/entity/session.dart';
import 'package:curse_db/features/info_db/view/bloc/db_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SessionController {
  final TextEditingController filmID = TextEditingController();
  final TextEditingController cinemaID = TextEditingController();
  final TextEditingController freeSeats = TextEditingController();
  final TextEditingController tariffID = TextEditingController();
}

class AddSessionWidget extends StatelessWidget {
  SessionController sessionController = SessionController();
  AddSessionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputContainer(
          controller: sessionController.filmID,
          hint: 'ID фильма',
        ),
        InputContainer(
          controller: sessionController.cinemaID,
          hint: 'ID кинотеатра',
        ),
        InputContainer(
            controller: sessionController.freeSeats,
            hint: 'Количество свободных мест'),
        InputContainer(
          controller: sessionController.tariffID,
          hint: 'ID тарифа',
        ),
        ButtonContainer(
          title: 'Добавить сеанс',
          onTap: () {
            BlocProvider.of<DbBloc>(context).add(
              AddSession(
                session: Session(
                  filmID: int.parse(sessionController.filmID.text.trim()),
                  cinemaID: int.parse(sessionController.cinemaID.text.trim()),
                  freeSeats: int.parse(sessionController.freeSeats.text.trim()),
                  dateTime: DateTime.now(),
                  tariffID: int.parse(sessionController.tariffID.text.trim()),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
