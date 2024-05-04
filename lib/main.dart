import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:lite_ref/lite_ref.dart';
import 'package:sportoutside/data/datasource/offline_db.dart';
import 'package:sportoutside/view/map/map_store.dart';
import 'package:sportoutside/view/map_widget.dart';

final offlineDB = OfflineDB(
    amout: 100, spreadRadius: 0.1, startZone: const LatLng(48.37, 10.89));
final mapstore = Ref.scoped((ctx) => MapStore(offlineDB));
void main() {
  runApp(const LiteRefScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MapWidget());
  }
}
