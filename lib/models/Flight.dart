class Flight {
  final String id;
  final String flightNumber;
  final String arrival_time;
  final String departure_time;
  final String departure_place;
  final String arrival_place;
  final String flight_duration;

  Flight(
      {required this.id,
      required this.flightNumber,
      required this.arrival_time,
      required this.departure_time,
      required this.departure_place,
      required this.arrival_place,
      required this.flight_duration});
}
