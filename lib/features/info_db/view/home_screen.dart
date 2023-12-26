import 'package:curse_db/core/enums.dart';
import 'package:curse_db/features/auth/bloc/auth_bloc.dart';
import 'package:curse_db/features/info_db/view/admin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widget/add_cinema.dart';
import 'worker_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: const Text(
              "Иван Костенко",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                if (state.userStatus == UserStatus.admin) AdminScreen(),
                if (state.userStatus == UserStatus.worker) WorkerScreen(),
              ],
            ),
          ),
        );
      },
    );
  }
}
