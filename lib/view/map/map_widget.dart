import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';
import 'package:signals/signals_flutter.dart';
import 'package:sportoutside/main.dart';
import 'package:sportoutside/misc/tile_provider.dart';
import 'package:sportoutside/view/map/sportplace_icon_widget.dart';
import 'package:sportoutside/view/map/sportplace_preview_widget.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO need markers
    var sportplaces = mapstore.of(context).sportPlaces..watch(context);
    List<Marker> markers = [];

    return sportplaces.value.maybeMap<Widget>(
        orElse: () => const Text("Loading..."),
        data: (value) {
          markers = value
              .map((e) => Marker(
                  width: 80.0,
                  height: 80.0,
                  point:
                      LatLng(e.coordinates.latitude, e.coordinates.longitude),
                  child: GestureDetector(
                    child: SportPlaceIconWidget(sportPlace: e, size: 50),
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (builder) =>
                              SportPlacePreviewWidget(sportPlace: e));
                    },
                  )
                  //SportPlaceIconWidget(sportPlace: e, size: 50)
                  ))
              .toList();
          return FlutterMap(
            options: const MapOptions(
              initialCenter: LatLng(48.37, 10.89),
              minZoom: 10,
              initialZoom: 10.0,
            ),
            children: [
              openStreetMapTileLayer,
              MarkerClusterLayerWidget(
                  options: MarkerClusterLayerOptions(
                      size: const Size(100, 100),
                      maxClusterRadius: 120,
                      builder: (BuildContext context, markers) {
                        return Container(
                          decoration: BoxDecoration(
                              border: Border.all(),
                              shape: BoxShape.circle,
                              color: Colors.blue),
                          child: Center(
                            child: Text(
                              markers.length.toString(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      },
                      markers: markers))
            ],
          );
        });
  }
}
