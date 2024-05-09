import 'dart:async';

import 'package:latlong2/latlong.dart';
import 'package:sportoutside/data/datasource/i_api.dart';
import 'package:sportoutside/data/dummy/sportplace_factory.dart';
import 'package:sportoutside/domain/entities/sportplace.dart';

class OfflineDB implements IApi {
  late List<SportPlace> _sportPlaces;
  final SportPlaceFactory _sportPlaceFactory = SportPlaceFactory();
  final int amout;
  final double spreadRadius;
  final LatLng startZone;
  OfflineDB(
      {required this.amout,
      required this.spreadRadius,
      required this.startZone}) {
    _sportPlaces = _sportPlaceFactory.createSportPlace(
        amount: amout, spreadRadius: spreadRadius, startZone: startZone);
  }

  @override
  FutureOr<List<SportPlace>> getSportPlaces() async {
    await Future.delayed(const Duration(seconds: 4));
    return _sportPlaces;
  }
}
