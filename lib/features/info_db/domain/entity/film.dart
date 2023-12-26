class Film {
  final int? id;
  final String name;
  final String purpose;
  final String production;
  final String director;
  final String genre;
  final int rentalPrice;

  Film(
      {this.id,
      required this.purpose,
      required this.production,
      required this.director,
      required this.name,
      required this.genre,
      required this.rentalPrice});
}
