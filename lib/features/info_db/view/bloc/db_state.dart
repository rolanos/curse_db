// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'db_bloc.dart';

class DbState {
  const DbState({this.userStatus = UserStatus.worker});

  final UserStatus userStatus;
}

class DbInitialEmpty extends DbState {}

//для админа
class DbAdmin extends DbState {}

class DbInitial extends DbState {
  final List<Cinema> cinemas;
  final List<Session> sessions;
  final List<Film> films;
  final Category? category;

  DbInitial(
      {this.films = const [],
      this.cinemas = const [],
      this.sessions = const [],
      this.category});
}
