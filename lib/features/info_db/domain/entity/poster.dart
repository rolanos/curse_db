class Poster {
  final int cinemaID;
  final int filmID;
  final int? relationID;

  Poster({
    required this.cinemaID,
    required this.filmID,
    this.relationID,
  });
}
