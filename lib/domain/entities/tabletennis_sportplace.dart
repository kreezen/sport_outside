import 'package:sportoutside/domain/entities/sportplace.dart';

class TabletennisSportplace extends SportPlace {
  final int numberOfTables;

  const TabletennisSportplace(
      {required super.id,
      required super.date,
      required this.numberOfTables,
      required super.tags,
      required super.description,
      required super.comments,
      required super.images});

  @override
  List<Object?> get props => super.props..add(numberOfTables);
}
