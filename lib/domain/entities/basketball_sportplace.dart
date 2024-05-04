import 'package:sportoutside/domain/entities/sportplace.dart';

class BasketballSportPlace extends SportPlace {
  const BasketballSportPlace(
      {required super.id,
      required super.date,
      required super.tags,
      required super.description,
      required super.coordinates,
      required super.comments,
      required super.images});
}
