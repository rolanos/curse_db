import 'package:curse_db/features/info_db/domain/entity/tariff.dart';

class TariffHelper {
  static Map<String, dynamic> toMap(Tariff tariff) {
    return <String, dynamic>{
      'id_tariff': tariff.id,
      'id_category': tariff.categoryID,
      'id_film': tariff.filmID,
      'cost': tariff.cost,
    };
  }

  static Tariff fromMap(Map<String, dynamic> map) {
    return Tariff(
      id: map['id_tariff'] as int,
      categoryID: map['id_category'] as int,
      filmID: map['id_film'] as int,
      cost: map['cost'] as int,
    );
  }
}
