import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:sportoutside/main.dart';

class GPSfiledWidget extends StatelessWidget {
  const GPSfiledWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var position = gpsStore.of(context).gpsPosition..watch(context);
    var err = gpsStore.of(context).gpsError;

    err.listen(context, () {
      if (err.value != null) {
        final messenger = ScaffoldMessenger.of(context);
        messenger.hideCurrentSnackBar();
        messenger.showSnackBar(
          SnackBar(content: Text(err.value.toString())),
        );
      }
    });

    return Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
        child: TextField(
          controller: TextEditingController(
            text: position.value.maybeMap<String>(
                orElse: () => "Loading...",
                data: (value) {
                  return value == null ? "do the tap" : value.toString();
                }),
          ),
          readOnly: true,
          onTap: () {
            gpsStore.of(context).getPosition();
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'click to get location',
            prefixIcon: Icon(Icons.location_on),
          ),
        ));
  }
}
