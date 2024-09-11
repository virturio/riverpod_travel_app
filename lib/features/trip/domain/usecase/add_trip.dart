import 'package:riverpod_travel_app/features/trip/domain/entities/trip.dart';
import 'package:riverpod_travel_app/features/trip/domain/repositories/trip_repository.dart';

class AddTrip {
  final TripRepository _repository;
  AddTrip(TripRepository repository) : _repository = repository;

  Future<void> call(Trip trip) {
    return _repository.addTrip(trip);
  }
}
