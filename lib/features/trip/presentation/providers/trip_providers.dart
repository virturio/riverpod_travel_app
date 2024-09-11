import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_travel_app/features/trip/data/datasources/trip_datasource.dart';
import 'package:riverpod_travel_app/features/trip/data/datasources/trip_local_datasource.dart';
import 'package:riverpod_travel_app/features/trip/data/models/trip_model.dart';
import 'package:riverpod_travel_app/features/trip/data/repositories/trip_repository_impl.dart';
import 'package:riverpod_travel_app/features/trip/domain/entities/trip.dart';
import 'package:riverpod_travel_app/features/trip/domain/repositories/trip_repository.dart';
import 'package:riverpod_travel_app/features/trip/domain/usecase/add_trip.dart';
import 'package:riverpod_travel_app/features/trip/domain/usecase/delete_trip.dart';
import 'package:riverpod_travel_app/features/trip/domain/usecase/get_trips.dart';

final tripDataSourceProvider = Provider<TripDatasource>((ref) {
  final tripBox = Hive.box<TripModel>("trips");
  final dataSource = TripLocalDatasource(tripBox);
  return dataSource;
});

final tripRepositoryProvider = Provider<TripRepository>((ref) {
  final dataSource = ref.read(tripDataSourceProvider);
  return TripRepositoryImpl(dataSource);
});

final getTripsProvider = Provider<GetTrips>((ref) {
  final repository = ref.read(tripRepositoryProvider);
  return GetTrips(repository);
});

final addTripProvider = Provider<AddTrip>((ref) {
  final repository = ref.read(tripRepositoryProvider);
  return AddTrip(repository);
});

final deleteTripProvider = Provider<DeleteTrip>((ref) {
  final repository = ref.read(tripRepositoryProvider);
  return DeleteTrip(repository);
});

final tripListNotifierProvider =
    StateNotifierProvider<TripListNotifier, List<Trip>>((ref) {
  final addTrip = ref.read(addTripProvider);
  final getTrip = ref.read(getTripsProvider);
  final deleteTrip = ref.read(deleteTripProvider);

  return TripListNotifier(
    getTrip,
    addTrip,
    deleteTrip,
  );
});

class TripListNotifier extends StateNotifier<List<Trip>> {
  final GetTrips _getTrips;
  final AddTrip _addTrip;
  final DeleteTrip _deleteTrip;

  TripListNotifier(this._getTrips, this._addTrip, this._deleteTrip) : super([]);

  // Load trips from the repository and update the state.
  Future<void> loadTrips() async {
    final tripsOrFailure = await _getTrips();
    tripsOrFailure.fold((error) => state = [], (trips) => state = trips);
  }

  Future<void> addNewTrip(Trip trip) async {
    await _addTrip(trip);
    //state = [...state, trip];
  }

  Future<void> removeTrip(int index) async {
    await _deleteTrip(index);
  }
}
