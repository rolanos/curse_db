import 'package:curse_db/core/widget/button_container.dart';
import 'package:curse_db/core/widget/input_container.dart';
import 'package:curse_db/features/info_db/domain/entity/tariff.dart';
import 'package:curse_db/features/info_db/view/bloc/db_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///TODO сделать!!!
class AddTariffWidget extends StatelessWidget {
  final TextEditingController categoryId = TextEditingController();
  final TextEditingController filmID = TextEditingController();
  final TextEditingController cost = TextEditingController();
  AddTariffWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputContainer(controller: categoryId, hint: 'ID категории'),
        InputContainer(controller: filmID, hint: 'ID фильма'),
        InputContainer(controller: cost, hint: 'Стоимость'),
        ButtonContainer(
          title: 'Добавить тариф',
          onTap: () {
            BlocProvider.of<DbBloc>(context).add(
              AddTariff(
                tariff: Tariff(
                  categoryID: int.parse(categoryId.text.trim()),
                  filmID: int.parse(filmID.text.trim()),
                  cost: int.parse(cost.text.trim()),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
