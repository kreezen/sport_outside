import 'dart:async';
import 'package:sportoutside/domain/entities/sportplace.dart';

abstract interface class IApi {
  FutureOr<List<SportPlace>> getSportPlaces();
}
