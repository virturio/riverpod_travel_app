import 'package:riverpod_travel_app/features/trip/domain/entities/trip.dart';
import 'package:riverpod_travel_app/features/trip/domain/repositories/trip_repository.dart';

class DeleteTrip {
  final TripRepository _repository;
  DeleteTrip(TripRepository repository) : _repository = repository;

  Future<void> call(Trip trip) {
    return _repository.deleteTrip(trip);
  }
}
