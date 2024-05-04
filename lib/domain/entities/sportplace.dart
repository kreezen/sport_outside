import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';
import 'package:sportoutside/domain/entities/comment.dart';

class SportPlace extends Equatable {
  final int id;
  final DateTime date;
  final List<String> images;
  final String description;
  final List<String> tags;
  final List<Comment> comments;
  final LatLng coordinates;

  String get formattedDate => date.toIso8601String();

  const SportPlace(
      {required this.id,
      required this.coordinates,
      required this.date,
      required this.images,
      required this.description,
      required this.tags,
      required this.comments});

  @override
  List<Object?> get props => [id, date, images, description, tags];
}
