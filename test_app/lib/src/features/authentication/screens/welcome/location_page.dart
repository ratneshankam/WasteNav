import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:test_app/src/constants/api_key.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationPage extends StatelessWidget {
   LocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(18.466630353721346, 73.83658948483483),
          zoom: 13,
        ),
        markers: Set<Marker>.of(_markers.values),
      ),
    );
  }

  final Map<MarkerId, Marker> _markers = {
    MarkerId("1"): Marker(
      markerId: MarkerId("1"),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(18.43539699894061, 73.849720680834),
    ),
    MarkerId("2"): Marker(
      markerId: MarkerId("2"),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(18.447300949283868, 73.85738005241234),
    ),
    MarkerId("3"): Marker(
      markerId: MarkerId("3"),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(18.45271156312487, 73.85754301776507),
    ),
    MarkerId("4"): Marker(
      markerId: MarkerId("4"),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(18.45796742475206, 73.8565652256487),
    ),
    MarkerId("5"): Marker(
      markerId: MarkerId("5"),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(18.468478665205044, 73.85395778000499),
    ),
    MarkerId("6"): Marker(
      markerId: MarkerId("6"),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(18.473270340539955, 73.85770598311781),
    ),
    MarkerId("7"): Marker(
      markerId: MarkerId("7"),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(18.45868327648182, 73.81364864204076),
    ),
  };
}
