import 'package:curse_db/features/info_db/domain/entity/poster.dart';

class PosterHelper {
  static Map<String, dynamic> toMap(Poster poster) {
    return <String, dynamic>{
      'id_cinema': poster.cinemaID,
      'id_film': poster.filmID,
      'id_relation': poster.relationID,
    };
  }

  static Poster fromMap(Map<String, dynamic> map) {
    return Poster(
      cinemaID: map['id_cinema'] as int,
      filmID: map['id_film'] as int,
      relationID: map['id_relation'] as int,
    );
  }
}
