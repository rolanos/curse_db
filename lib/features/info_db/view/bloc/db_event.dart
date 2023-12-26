part of 'db_bloc.dart';

class DbEvent {
  const DbEvent();
}

class InitProfile extends DbEvent {
  final UserStatus userStatus;

  InitProfile({required this.userStatus});
}

//GENERAL
class GetCinemas extends DbEvent {}

class GetFilms extends DbEvent {
  final String name;

  GetFilms({required this.name});
}

class GetSessions extends DbEvent {
  final int id;

  GetSessions({required this.id});
}

//ADMIN
class AddCinemaEvent extends DbEvent {
  final Cinema cinema;

  AddCinemaEvent({required this.cinema});
}

class AddSession extends DbEvent {
  final Session session;

  AddSession({required this.session});
}

class AddFilmEvent extends DbEvent {
  final Film film;
  final String cinemaName;
  AddFilmEvent(this.cinemaName, {required this.film});
}

class AddCategory extends DbEvent {
  final Category category;

  AddCategory({required this.category});
}

class AddTariff extends DbEvent {
  final Tariff tariff;

  AddTariff({required this.tariff});
}

class RemoveFilmEvent extends DbEvent {
  final int id;
  final String cinemaName;

  RemoveFilmEvent(this.cinemaName, {required this.id});
}

class RemoveSessionEvent extends DbEvent {
  final int id;

  RemoveSessionEvent({required this.id});
}
