import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:lite_ref/lite_ref.dart';
import 'package:sportoutside/data/datasource/offline_db.dart';
import 'package:sportoutside/view/add_sportplace/add_sportplace_widget.dart';
import 'package:sportoutside/view/add_sportplace/camera_store.dart';
import 'package:sportoutside/view/map/map_page.dart';
import 'package:sportoutside/view/map/map_store.dart';

//Services
final offlineDB = OfflineDB(
    amout: 100, spreadRadius: 0.1, startZone: const LatLng(48.37, 10.89));
final mapstore = Ref.scoped((ctx) => MapStore(offlineDB));
final cameraStore = Ref.scoped((ctx) => CameraStore());

void main() {
  runApp(const LiteRefScope(child: MyApp()));
}

//Routes
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const MapPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'add/sportplace',
          builder: (BuildContext context, GoRouterState state) {
            return const AddSportPlaceWidget();
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}
