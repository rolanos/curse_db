import 'package:curse_db/core/enums.dart';
import 'package:curse_db/core/widget/button_container.dart';
import 'package:curse_db/features/auth/bloc/auth_bloc.dart';
import 'package:curse_db/features/info_db/view/bloc/db_bloc.dart';
import 'package:curse_db/features/info_db/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Выберите группу пользователей",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.2),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonContainer(
                title: 'Работник службы',
                onTap: () {
                  BlocProvider.of<AuthBloc>(context).add(SignInWithWorker());
                  BlocProvider.of<DbBloc>(context)
                      .add(InitProfile(userStatus: UserStatus.worker));

                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
              ),
              const SizedBox(
                height: 16.0,
              ),
              ButtonContainer(
                title: 'Администратор БД',
                onTap: () {
                  BlocProvider.of<AuthBloc>(context).add(SignInWithAdmin());
                  BlocProvider.of<DbBloc>(context)
                      .add(InitProfile(userStatus: UserStatus.admin));
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
