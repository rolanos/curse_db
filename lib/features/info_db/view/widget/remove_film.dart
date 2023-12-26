import 'package:curse_db/core/widget/button_container.dart';
import 'package:curse_db/core/widget/input_container.dart';
import 'package:curse_db/features/info_db/view/bloc/db_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoveCinema extends StatelessWidget {
  final TextEditingController name = TextEditingController();
  final TextEditingController id = TextEditingController();
  RemoveCinema({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InputContainer(
          controller: name,
          hint: 'Название кинотеатра',
        ),
        InputContainer(
          controller: name,
          hint: 'id фильма',
        ),
        ButtonContainer(
          title: "Удалить фильм из проката",
          onTap: () {
            BlocProvider.of<DbBloc>(context).add(
              RemoveFilmEvent(
                name.text.trim(),
                id: int.parse(id.text.trim()),
              ),
            );
          },
        ),
      ],
    );
  }
}
