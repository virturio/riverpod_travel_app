import 'package:hive/hive.dart';
import 'package:riverpod_travel_app/features/trip/domain/entities/trip.dart';

part 'trip_model.g.dart';

@HiveType(typeId: 0)
class TripModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final List<String> photos;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final DateTime date;
  @HiveField(4)
  final String location;

  TripModel({
    required this.title,
    required this.description,
    required this.date,
    required this.photos,
    required this.location,
  });

  factory TripModel.fromEntity(Trip trip) {
    return TripModel(
      title: trip.title,
      photos: trip.photos,
      description: trip.description,
      date: trip.date,
      location: trip.location,
    );
  }

  Trip toEntity() {
    return Trip(
      title: title,
      photos: photos,
      description: description,
      date: date,
      location: location,
    );
  }
}
