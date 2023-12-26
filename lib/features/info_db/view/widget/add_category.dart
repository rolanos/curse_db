import 'package:curse_db/core/widget/button_container.dart';
import 'package:curse_db/core/widget/input_container.dart';
import 'package:curse_db/features/info_db/domain/entity/category.dart';
import 'package:curse_db/features/info_db/view/bloc/db_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCategoryWidget extends StatelessWidget {
  final TextEditingController capacity = TextEditingController();
  AddCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputContainer(
          controller: capacity,
          hint: 'Вместимость',
        ),
        ButtonContainer(
          title: 'Добавить категорию',
          onTap: () {
            BlocProvider.of<DbBloc>(context).add(
              AddCategory(
                category: Category(
                  capacity: int.parse(
                    capacity.text.trim(),
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
