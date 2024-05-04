import 'package:signals/signals.dart';
import 'package:sportoutside/data/datasource/i_api.dart';
import 'package:sportoutside/domain/entities/sportplace.dart';

class MapStore {
  final _sportPlaces = AsyncSignal<List<SportPlace>>(AsyncData([]));
  late IApi _api;
  AsyncSignal<List<SportPlace>> get sportPlaces => _sportPlaces;

  MapStore(IApi api) {
    _api = api;
    _initializeSportPlaces();
  }

  Future<void> _initializeSportPlaces() async {
    _sportPlaces.value = AsyncState.loading();
    var places = await _api.getSportPlaces();
    _sportPlaces.value = AsyncState.data(places);
  }
}
