import 'dart:math';

import 'package:latlong2/latlong.dart';
import 'package:sportoutside/domain/entities/basketball_sportplace.dart';
import 'package:sportoutside/domain/entities/calisthenic_sportplace.dart';
import 'package:sportoutside/domain/entities/comment.dart';
import 'package:sportoutside/domain/entities/skaten_sportplace.dart';
import 'package:sportoutside/domain/entities/soccer_sportplace.dart';
import 'package:sportoutside/domain/entities/sport_type.dart';
import 'package:sportoutside/domain/entities/sportplace.dart';
import 'package:sportoutside/domain/entities/tabletennis_sportplace.dart';

class SportPlaceFactory {
  List<SportPlace> createSportPlace({
    required int amount,
    required double spreadRadius,
    required LatLng startZone,
  }) {
    List<SportPlace> sportplaces = [];

    for (int i = 0; i < amount; i++) {
      //cordinate spread
      double angle = i * (2 * pi) / amount;
      double x = startZone.latitude + spreadRadius * cos(angle);
      double y = startZone.longitude + spreadRadius * sin(angle);
      LatLng coordinates = LatLng(x, y);

      Random random = Random();
      var type = SportType.values[random.nextInt(SportType.values.length)];
      var sportplace = addSportsPlace(
        i,
        type,
        coordinates,
        description,
        tags,
        images,
        comments(i),
      );
      sportplaces.add(sportplace);
    }
    return sportplaces;
  }

  List<String> get images {
    return [
      'https://img.pr0gramm.com/2024/01/06/95fada5476056a79.jpg',
      'https://img.pr0gramm.com/2023/10/25/d6efd74ecd179913.jpg',
      'https://img.pr0gramm.com/2023/09/13/a5964efec6a898bd.png'
    ];
  }

  List<Comment> comments(int id) {
    return [
      Comment(
          id: id + 1,
          text: "comment1",
          date: DateTime.now(),
          author: "author1"),
      Comment(
          id: id + 2,
          text: "comment2",
          date: DateTime.now(),
          author: "author2"),
    ];
  }

  String get description {
    return "This is a description";
  }

  List<String> get tags {
    return ["tag1", "tag2", "tag3"];
  }

  SportPlace addSportsPlace(
      int id,
      SportType type,
      LatLng newLocation,
      String description,
      List<String> tags,
      List<String> images,
      List<Comment> comments) {
    switch (type) {
      case SportType.Tabletennis:
        return TabletennisSportPlace(
          coordinates: newLocation,
          tags: tags,
          description: description,
          date: DateTime.now(),
          id: id,
          images: images,
          numberOfTables: 2,
          comments: comments,
        );
      case SportType.Soccer:
        return SoccerSportPlace(
          coordinates: newLocation,
          tags: tags,
          description: description,
          date: DateTime.now(),
          id: id,
          images: images,
          comments: comments,
        );
      case SportType.Skaten:
        return SkatenSportPlace(
          coordinates: newLocation,
          tags: tags,
          description: description,
          date: DateTime.now(),
          id: id,
          images: images,
          comments: comments,
        );
      case SportType.Calisthenics:
        return CalistenicSportPlace(
          coordinates: newLocation,
          tags: tags,
          description: description,
          date: DateTime.now(),
          id: id,
          images: images,
          comments: comments,
        );

      case SportType.Basketball:
        return BasketballSportPlace(
          coordinates: newLocation,
          tags: tags,
          description: description,
          date: DateTime.now(),
          id: id,
          images: images,
          comments: comments,
        );
      // Add cases for other sport types...
      default:
        throw Exception('SportType not supported');
    }
  }
}
