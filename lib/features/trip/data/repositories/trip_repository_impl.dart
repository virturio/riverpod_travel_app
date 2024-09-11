import 'package:dartz/dartz.dart';
import 'package:riverpod_travel_app/core/error/failure.dart';
import 'package:riverpod_travel_app/features/trip/data/datasources/trip_datasource.dart';
import 'package:riverpod_travel_app/features/trip/data/models/trip_model.dart';
import 'package:riverpod_travel_app/features/trip/domain/entities/trip.dart';
import 'package:riverpod_travel_app/features/trip/domain/repositories/trip_repository.dart';

class TripRepositoryImpl extends TripRepository {
  final TripDatasource dataSource;
  TripRepositoryImpl(this.dataSource);

  @override
  Future<void> addTrip(Trip trip) async {
    return dataSource.addTrip(TripModel.fromEntity(trip));
  }

  @override
  Future<void> deleteTrip(Trip trip) async {
    return dataSource.deleteTrip(TripModel.fromEntity(trip));
  }

  @override
  Future<Either<Failure, List<Trip>>> getTrips() async {
    try {
      final trips = dataSource.getTrips().map((e) => e.toEntity()).toList();
      return Right(trips);
    } catch (e) {
      return Left(SomeSpecificError(message: e.toString()));
    }
  }
}
