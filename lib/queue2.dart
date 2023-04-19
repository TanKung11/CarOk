import 'dart:collection';

class CarWashQueueBooking {
  late DateTime _timeReservationStart;
  late DateTime _timeReservationEnd;
  List<DateTime> _reservedTimes = [];

  CarWashQueueBooking(DateTime timeReservationStart) {
    // Set reservation start time
    _timeReservationStart = timeReservationStart;

    // Set reservation end time as 30 minutes after reservation start time
    _timeReservationEnd = _timeReservationStart.add(Duration(minutes: 30));
  }

  // Method to check if a reservation time is valid
  bool isReservationTimeValid(DateTime reservationTime) {
    // Check if reservation time is within reservation window
    if (reservationTime.isBefore(_timeReservationStart)) {
      return false;
    }
    if (reservationTime.isAfter(_timeReservationEnd)) {
      return false;
    }

    // Check if reservation time is less than 30 minutes after start time
    if (reservationTime.difference(_timeReservationStart).inMinutes > 30) {
      return false;
    }

    // Check if reservation time overlaps with existing reservations
    for (var existingReservation in _reservedTimes) {
      if (reservationTime.isAfter(existingReservation) &&
          reservationTime.difference(existingReservation).inMinutes < 30) {
        return false;
      }
      if (existingReservation.isAfter(reservationTime) &&
          existingReservation.difference(reservationTime).inMinutes < 30) {
        return false;
      }
    }

    // Reservation time is valid
    return true;
  }

  // Method to reserve a time slot
  void reserveTime(DateTime reservationTime) {
    if (isReservationTimeValid(reservationTime)) {
      _reservedTimes.add(reservationTime);
      print('จองเวลาเรียบร้อยที่ ${reservationTime.toString()}');
    } else {
      print('เวลาที่เลือกไม่ถูกต้อง');
    }
  }

  // Method to show reserved times
  void showReservedTimes() {
    print('เวลาที่ได้ทำการจองไว้:');
    for (var reservedTime in _reservedTimes) {
      print(reservedTime.toString());
    }
  }
}