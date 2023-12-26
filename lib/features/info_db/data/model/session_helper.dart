import 'package:curse_db/features/info_db/domain/entity/session.dart';

class SessionHelper {
  static Map<String, dynamic> toMap(Session session) {
    return <String, dynamic>{
      'id_session': session.id,
      'id_film': session.filmID,
      'id_cinema': session.cinemaID,
      'free_seats': session.freeSeats,
      'date_time': session.dateTime.toIso8601String(),
      'id_tariff': session.tariffID,
      'id_relation': session.relationID,
    };
  }

  static Session fromMap(Map<String, dynamic> map) {
    return Session(
      id: map['id_session'] as int,
      filmID: map['id_film'] as int,
      cinemaID: map['id_cinema'] as int,
      freeSeats: map['free_seats'] as int,
      dateTime: DateTime.parse(map['date_time'] as String),
      tariffID: map['id_tariff'] as int,
      relationID: map['id_relation'] != null ? map['id_relation'] as int : 0,
    );
  }
}
