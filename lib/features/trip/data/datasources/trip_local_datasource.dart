import 'package:hive/hive.dart';
import 'package:riverpod_travel_app/features/trip/data/datasources/trip_datasource.dart';
import 'package:riverpod_travel_app/features/trip/data/models/trip_model.dart';

class TripLocalDatasource extends TripDatasource {
  final Box<TripModel> tripBox;

  TripLocalDatasource(this.tripBox);

  @override
  void addTrip(TripModel trip) {
    tripBox.add(trip);
  }

  @override
  void deleteTrip(TripModel trip) {
    tripBox.delete(trip);
  }

  @override
  List<TripModel> getTrips() {
    return tripBox.values.toList();
  }
}
