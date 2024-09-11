import 'package:dartz/dartz.dart';
import 'package:riverpod_travel_app/core/error/failure.dart';
import 'package:riverpod_travel_app/features/trip/domain/entities/trip.dart';

abstract class TripRepository {
  Future<Either<Failure, List<Trip>>> getTrips();
  Future<void> deleteTrip(int index);
  Future<void> addTrip(Trip trip);
}
