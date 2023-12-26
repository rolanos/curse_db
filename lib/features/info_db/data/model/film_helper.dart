import 'package:curse_db/features/info_db/domain/entity/film.dart';

class FilmHelper {
  static Map<String, dynamic> toMap(Film film) {
    return <String, dynamic>{
      'id_film': film.id,
      'purpose': film.purpose,
      'production': film.production,
      'director': film.director,
      'genre': film.genre,
      'rental_price': film.rentalPrice,
      'name': film.name,
    };
  }

  static Film fromMap(Map<String, dynamic> map) {
    return Film(
      id: map['id_film'] as int,
      purpose: map['purpose'] as String,
      production: map['production'] as String,
      director: map['director'] as String,
      genre: map['genre'] as String,
      rentalPrice: map['rental_price'] as int,
      name: map['name'] as String,
    );
  }
}
