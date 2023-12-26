class Tariff {
  final int? id;
  final int categoryID;
  final int filmID;
  final int cost;

  Tariff({
    this.id,
    required this.categoryID,
    required this.filmID,
    required this.cost,
  });
}
