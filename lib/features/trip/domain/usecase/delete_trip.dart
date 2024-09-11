import 'package:riverpod_travel_app/features/trip/domain/repositories/trip_repository.dart';

class DeleteTrip {
  final TripRepository _repository;
  DeleteTrip(TripRepository repository) : _repository = repository;

  Future<void> call(int index) {
    return _repository.deleteTrip(index);
  }
}
