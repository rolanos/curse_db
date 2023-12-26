import 'package:curse_db/features/info_db/domain/entity/cinema.dart';

class CinemaHelper {
  static Map<String, dynamic> toMap(Cinema cinema) {
    return <String, dynamic>{
      'id_cinema': cinema.id,
      'name': cinema.name,
      'id_category': cinema.categoryID,
      'address': cinema.address,
      'district': cinema.district,
    };
  }

  static Cinema fromMap(Map<String, dynamic> map) {
    return Cinema(
      id: map['id_cinema'] as int,
      name: map['name'] as String,
      categoryID: map['id_category'] as int,
      address: map['address'] as String,
      district: map['district'] as String,
    );
  }
}
