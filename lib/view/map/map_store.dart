import 'dart:async';

import 'package:lite_ref/lite_ref.dart';
import 'package:signals/signals.dart';
import 'package:signals/signals_flutter.dart';
import 'package:sportoutside/data/datasource/i_api.dart';
import 'package:sportoutside/domain/entities/sportplace.dart';

class MapStore extends Disposable {
  final _sportPlaces = AsyncSignal<List<SportPlace>>(const AsyncData([]));
  final _loading = Signal<bool>(false);
  /* late Connect<bool, bool> _loadingState; */
  late final StreamSubscription _sportPlacesSubscription;

  late IApi _api;

  AsyncSignal<List<SportPlace>> get sportPlaces => _sportPlaces;
  Signal<bool> get loading => _loading;
  /* Signal<bool> get loadingState => _loadingState.signal; */

  MapStore(IApi api) {
    _api = api;
    _initializeSportPlaces();
    _sportPlacesSubscription = _initLoadingState();
    /* _loadingState = connect(_loading).from(_initLoadingState2()); */
  }

  Future<void> _initializeSportPlaces() async {
    _sportPlaces.value = AsyncState.loading();
    var places = await _api.getSportPlaces();
    _sportPlaces.value = AsyncState.data(places);
  }

  StreamSubscription _initLoadingState() {
    return _sportPlaces.toStream().listen((event) {
      event.map(
        data: (_) => _loading.value = false,
        loading: () => _loading.value = true,
        error: (_) => _loading.value = false,
      );
    });
  }

  /* Stream<bool> _initLoadingState2() {
    return _sportPlaces.toStream().map((event) {
      return event.map<bool>(
        data: (_) => _loading.value = false,
        loading: (_) => _loading.value = true,
        error: (_) => _loading.value = false,
      );
    });
  } */

  @override
  void dispose() {
    _sportPlacesSubscription.cancel();
    /* _loadingState.dispose(); */
  }
}
