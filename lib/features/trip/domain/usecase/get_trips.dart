import 'package:dartz/dartz.dart';
import 'package:riverpod_travel_app/core/error/failure.dart';
import 'package:riverpod_travel_app/features/trip/domain/entities/trip.dart';
import 'package:riverpod_travel_app/features/trip/domain/repositories/trip_repository.dart';

class GetTrips {
  final TripRepository _repository;
  GetTrips(TripRepository repository) : _repository = repository;

  Future<Either<Failure, List<Trip>>> call() {
    return _repository.getTrips();
  }
}
