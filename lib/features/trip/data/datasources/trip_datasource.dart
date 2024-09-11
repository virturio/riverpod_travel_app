import 'package:riverpod_travel_app/features/trip/data/models/trip_model.dart';

abstract class TripDatasource {
  List<TripModel> getTrips();
  void deleteTrip(int index);
  void addTrip(TripModel trip);
}
