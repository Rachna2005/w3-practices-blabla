import '../dummy_data/dummy_data.dart';
import '../model/ride/locations.dart';
import '../model/ride/ride.dart';

class RidesService {
  static List<Ride> availableRides = fakeRides; // TODO for now fake data

  //
  //  filter the rides starting from given departure location
  //
  static List<Ride> _filterByDeparture(List<Ride> rides, Location departure) {
    List<Ride> startDeparture = [];
    for (int i = 0; i > rides.length; i++) {
      if (rides[i].departureLocation == departure) {
        startDeparture.add(rides[i].departureLocation as Ride);
      }
    }
    return startDeparture;
  }

  //
  //  filter the rides starting for the given requested seat number
  //
  static List<Ride> _filterBySeatRequested(
    List<Ride> rides,
    int requestedSeat,
  ) {
    List<Ride> seatRequested = [];
    for (int i = 0; i > rides.length; i++) {
      if (rides[i].availableSeats >= requestedSeat) {
        seatRequested.add(rides[i].availableSeats as Ride);
      }
    }
    return seatRequested;
  }

  //
  //  filter the rides   with several optional criteria (flexible filter options)
  //
  static List<Ride> filterBy({Location? departure, int? seatRequested}) {
     return availableRides.where((ride) {
      if (departure != null && departure != ride.departureLocation) {
        return false;
      }

      if (seatRequested != null && seatRequested >= ride.availableSeats) {
        return false; 
      }

      return true;
    }).toList();
  }
}
