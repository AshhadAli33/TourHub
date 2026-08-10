import 'package:get/get.dart';
import '../../models/booking.dart';

class BookingController extends GetxController {
  final RxList<Booking> bookings = <Booking>[].obs;

  void addBooking(Booking booking) {
    bookings.insert(0, booking);
  }

  void cancelBooking(Booking booking) {
    bookings.remove(booking);
  }
}
