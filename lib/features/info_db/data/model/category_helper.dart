import 'package:curse_db/features/info_db/domain/entity/category.dart';

class CategoryHelper {
  static Map<String, dynamic> toMap(Category category) {
    return <String, dynamic>{
      'id_category': category.id,
      'capacity': category.capacity,
    };
  }

  static Category fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id_category'] as int,
      capacity: map['capacity'] as int,
    );
  }
}
