import 'package:curse_db/features/info_db/domain/entity/cinema.dart';
import 'package:curse_db/features/info_db/view/bloc/db_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CinemaScreen extends StatefulWidget {
  const CinemaScreen({super.key, required this.cinema});
  final Cinema cinema;

  @override
  State<CinemaScreen> createState() => _CinemaScreenState();
}

class _CinemaScreenState extends State<CinemaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.cinema.name,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
          child: BlocBuilder<DbBloc, DbState>(
            builder: (context, state) {
              if (state is! DbInitial) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(32.0),
                      border:
                          Border.all(color: Colors.grey.shade300, width: 5.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Информаци о кинотеатре",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          "ID - ${widget.cinema.id}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          "Category ID - ${widget.cinema.categoryID}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          "Название - ${widget.cinema.name}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          "Адрес - ${widget.cinema.address}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          "Район - ${widget.cinema.district}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        if (state.category != null)
                          Text(
                            "Вместимость - ${state.category!.capacity}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  const Text(
                    "Афиша",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.films.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade400,
                                offset: const Offset(0, 10.0),
                                blurRadius: 16.0)
                          ],
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                (state.films[index].id ?? "-").toString(),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16.0),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                state.films[index].name,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16.0),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                state.films[index].director,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16.0),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                state.films[index].genre,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16.0),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                state.films[index].production,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16.0),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                state.films[index].purpose,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  const Text(
                    "Сеансы",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.sessions.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Container(
                        margin: EdgeInsets.only(right: 16.0),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade400,
                                offset: const Offset(0, 10.0),
                                blurRadius: 16.0)
                          ],
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                ("ID -" + state.sessions[index].id.toString())
                                    .toString(),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16.0),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                "ID кинотеатра -" +
                                    state.sessions[index].cinemaID.toString(),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16.0),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                "Время проведения - " +
                                    state.sessions[index].dateTime.toString(),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16.0),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                "ID фильма -" +
                                    state.sessions[index].filmID.toString(),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16.0),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                "Свободные места -" +
                                    state.sessions[index].freeSeats.toString(),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16.0),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                "ID тарифа -" +
                                    state.sessions[index].tariffID.toString(),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
