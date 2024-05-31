import 'package:flutter/material.dart';

class GPSfiledWidget extends StatelessWidget {
  const GPSfiledWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 8),
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'click to get location',
            prefixIcon: Icon(Icons.location_on),
          ),
        ));
  }
}
