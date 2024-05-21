import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:signals/signals_flutter.dart';
import 'package:sportoutside/main.dart';
import 'package:sportoutside/view/map/map_widget.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var loading = mapstore.of(context).loading..watch(context);

    return Scaffold(
      appBar: AppBar(
          actions: loading.value ? [const CircularProgressIndicator()] : []),
      body: const MapWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GoRouter.of(context).push('/add/sportplace');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
