import 'tour_post.dart';

class Booking {
  final TourPost post;
  final DateTime travelDate;
  final int guests;
  final DateTime bookedAt;

  const Booking({
    required this.post,
    required this.travelDate,
    required this.guests,
    required this.bookedAt,
  });

  double get total => post.price * guests;
}
