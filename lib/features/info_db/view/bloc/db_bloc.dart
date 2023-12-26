import 'package:bloc/bloc.dart';
import 'package:curse_db/core/db_service.dart';
import 'package:curse_db/core/enums.dart';
import 'package:curse_db/features/info_db/domain/entity/cinema.dart';
import 'package:curse_db/features/info_db/domain/entity/film.dart';
import 'package:curse_db/features/info_db/domain/entity/session.dart';
import 'package:curse_db/features/info_db/domain/entity/category.dart';
import 'package:curse_db/features/info_db/domain/entity/tariff.dart';

part 'db_event.dart';
part 'db_state.dart';

class DbBloc extends Bloc<DbEvent, DbState> {
  DatabaseService db = DatabaseService();
  DbBloc() : super(DbInitialEmpty()) {
    on<InitProfile>((event, emit) async {
      if (event.userStatus == UserStatus.worker) {
        final List<Cinema> cinemas = await db.getCinemas();
        emit(DbInitial(cinemas: cinemas));
      } else {
        emit(DbAdmin());
      }
    });
    on<AddCinemaEvent>((event, emit) async => await db.addCinema(event.cinema));
    on<RemoveFilmEvent>(
        (event, emit) async => await db.removeFilm(event.id, event.cinemaName));
    on<AddFilmEvent>(
      (event, emit) async => await db.addFilm(event.film, event.cinemaName),
    );
    on<AddSession>((event, emit) async {
      await db.addSession(event.session);
    });
    on<AddCategory>(
        (event, emit) async => await db.addCategory(event.category));
    on<AddTariff>((event, emit) async => await db.addTariff(event.tariff));
    on<RemoveSessionEvent>(
        (event, emit) async => await db.removeSession(event.id));
    on<GetCinemas>((event, emit) async {
      final List<Cinema> cinemas = await db.getCinemas();
      emit(DbInitial(cinemas: cinemas));
    });
    on<GetFilms>((event, emit) async {
      final List<Film> films = await db.getFilms(event.name);
      if (state is DbInitial) {
        emit(
          DbInitial(
            cinemas: (state as DbInitial).cinemas,
            films: films,
          ),
        );
      }
    });
    on<GetSessions>((event, emit) async {
      final List<Session> sessions = await db.getSessions(event.id);
      final Category? category = await db.getCategory(event.id);
      if (state is DbInitial) {
        emit(
          DbInitial(
            cinemas: (state as DbInitial).cinemas,
            films: (state as DbInitial).films,
            sessions: sessions,
            category: category,
          ),
        );
      }
    });
  }
}
