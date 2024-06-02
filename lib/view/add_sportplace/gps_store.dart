import 'package:geolocator/geolocator.dart';
import 'package:signals/signals_flutter.dart';
import 'package:sportoutside/data/datasource/gps/gps_service.dart';

class GpsStore {
  final _gpsService = GpsService();

  final gpsPermission = AsyncSignal<LocationPermission?>(AsyncData(null));
  final gpsPosition = AsyncSignal<Position?>(AsyncData(null));
  final gpsError = Signal<Exception?>(null);

  void getPosition() async {
    var permission = await _gpsService.checkPermission();
    switch (permission) {
      case LocationPermission.denied:
        await _gpsService.requestPermission();
      case LocationPermission.deniedForever:
        gpsError.value = Exception('Permission denied');
        break;
      case LocationPermission.whileInUse:
      case LocationPermission.always:
        gpsPosition.value = AsyncLoading();
        gpsPosition.value = AsyncData(await _gpsService.getCurrentPosition());
        break;
      case LocationPermission.unableToDetermine:
        gpsError.value = Exception('Unable to determine permission');
        break;
    }
  }
}
