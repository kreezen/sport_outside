import 'package:sportoutside/domain/entities/sportplace.dart';

class TabletennisSportPlace extends SportPlace {
  final int numberOfTables;

  const TabletennisSportPlace(
      {required super.id,
      required super.date,
      required this.numberOfTables,
      required super.tags,
      required super.description,
      required super.coordinates,
      required super.comments,
      required super.images});

  @override
  List<Object?> get props => super.props..add(numberOfTables);
}
