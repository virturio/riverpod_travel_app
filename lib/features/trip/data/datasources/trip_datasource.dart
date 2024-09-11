import 'package:riverpod_travel_app/features/trip/data/models/trip_model.dart';

abstract class TripDatasource {
  List<TripModel> getTrips();
  void deleteTrip(TripModel trip);
  void addTrip(TripModel trip);
}
