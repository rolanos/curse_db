class Session {
  final int? id;
  final int filmID;
  final int cinemaID;
  final int freeSeats;
  final DateTime dateTime;
  final int tariffID;
  final int? relationID;

  Session({
    this.id,
    required this.filmID,
    required this.cinemaID,
    required this.freeSeats,
    required this.dateTime,
    required this.tariffID,
    this.relationID,
  });
}
