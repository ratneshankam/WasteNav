// // **********************// **********************// **********************// **********************// **********************// **********************// **********************
// // **********************// **********************// **********************// **********************// **********************// **********************// **********************
// // **********************// **********************// **********************// **********************// **********************// **********************// **********************
// // **********************// **********************// **********************// **********************// **********************// **********************// **********************

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:location/location.dart' as loc;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:test_app/src/constants/api_key.dart';
import 'package:test_app/src/features/authentication/screens/welcome/polyline_handler.dart';
import 'package:get/get.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;
  final loc.Location _locationController = loc.Location();
  double _originLatitude = 18.466630353721346,
      _originLongitude = 73.83658948483483;
  double _destLatitude = 18.4480873550439, _destLongitude = 73.85866507930936;
  // double _originLatitude = 26.48424, _originLongitude = 50.04551;
  // double _destLatitude = 26.46423, _destLongitude = 50.06358;
  Map<MarkerId, Marker> markers = {};
  Map<PolylineId, Polyline> polylines = {};
  Set<Polyline> _polyline = {};
  List<LatLng> polylineCoordinates = [
    const LatLng(18.466630353721346, 73.83658948483483),
    const LatLng(18.4480873550439, 73.85866507930936),
  ];
  String googleAPiKey = GOOGLE_MAPS_API_KEY;
  LatLng? _currentP;

  @override
  void initState() {
    super.initState();
    print("WE ARE IN INIT STATE");

    getLocationUpdates();

    /// origin marker
    _addMarker(LatLng(_originLatitude, _originLongitude), "origin",
        BitmapDescriptor.defaultMarker);

    /// destination marker
    _addMarker(LatLng(_destLatitude, _destLongitude), "destination",
        BitmapDescriptor.defaultMarker);
    _getPolyline();
    drawPolyline();
  }

  Future<void> getLocationUpdates() async {
    bool _serviceEnabled;
    loc.PermissionStatus _permissionGranted;

    _serviceEnabled = await _locationController.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _locationController.requestService();
    }

    _permissionGranted = await _locationController.hasPermission();
    if (_permissionGranted == loc.PermissionStatus.denied) {
      _permissionGranted = await _locationController.requestPermission();
      if (_permissionGranted != loc.PermissionStatus.granted) {
        return;
      }
    }

    _locationController.onLocationChanged
        .listen((loc.LocationData currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        setState(() {
          _currentP =
              LatLng(currentLocation.latitude!, currentLocation.longitude!);
          // _cameraToPosition(_currentP!);
        });
      }
    });
  }

  Future<void> drawPolyline() async {
    _polyline.clear();
    print("WE ARE IN DRAWPOLYLINE");
    print(polylineCoordinates);
    _polyline.add(Polyline(
      polylineId: PolylineId('poly'),
      visible: true, // this means this line should be visible to the user
      points:
          polylineCoordinates, // means from point a (source) to point b (destination) draw a polyline
      color: Colors.purple, // color of polyline
      width: 5,
    ));
  }

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
  }

  _addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker =
        Marker(markerId: markerId, icon: descriptor, position: position);
    markers[markerId] = marker;
  }

  _addPolyLine() {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        visible: true,
        polylineId: id,
        color: Colors.red,
        points: polylineCoordinates);
    polylines[id] = polyline;
    setState(() {});
  }

  void generatePolyLineFromPoints(List<LatLng> polylineCoordinates) {
    setState(() {
      PolylineId id = PolylineId("poly");
      Polyline polyline = Polyline(
          polylineId: id,
          color: Colors.black,
          points: polylineCoordinates,
          width: 8);
      polylines[id] = polyline;
    });
  }

  _getPolyline() async {
    print("WE ARE IN GETPOLYLINE");
    // PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
    //   googleAPiKey,
    //   PointLatLng(_originLatitude, _originLongitude),
    //   PointLatLng(_destLatitude, _destLongitude),
    //   travelMode: TravelMode.driving,
    // );
    // print("PRINTING RESULT $result");
    // var result = getPolylines(LatLng(_originLatitude, _originLongitude),
    //     LatLng(_destLatitude, _destLongitude));
    // if (result.points.isNotEmpty) {
    //   result.points.forEach((LatLng point) {
    //     polylineCoordinates.add(LatLng(point.latitude, point.longitude));
    //   });

    //   print("WE ARE IN BELOW GETPOLYLINE");
    //   setState(() {});
    // }
  }

  void showGoogleAutoComplete() async {
    Prediction? p = await PlacesAutocomplete.show(
        offset: 0,
        radius: 1000,
        strictbounds: false,
        region: "us",
        language: "en",
        context: context,
        mode: Mode.overlay,
        apiKey: googleAPiKey,
        types: ["(cities)"],
        hint: "Search City",
        components: [Component(Component.country, "us")]);
  }

  // build method --> scaffold is here!
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("WE ARE IN BUILD METHOD");
    return Scaffold(
      body: _currentP == null
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SpinKitFadingCircle(
                    color: Color.fromARGB(255, 35, 141, 38),
                    size: 80.0,
                  ),
                  SizedBox(height: 10),
                  Text("Loading..."),
                ],
              ),
            )
          : Stack(children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(
                    target: LatLng(_originLatitude, _originLongitude),
                    zoom: 15),
                myLocationEnabled: true,
                tiltGesturesEnabled: true,
                compassEnabled: true,
                scrollGesturesEnabled: true,
                zoomGesturesEnabled: true,
                zoomControlsEnabled: false,
                onMapCreated: _onMapCreated,
                markers: Set<Marker>.of(markers.values),
                polylines: _polyline,
              ),
              Positioned(
                top: 40,
                left: 20,
                right: 20,
                child: Container(
                  width: Get.width,
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: _searchController,
                    // readOnly: true,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: const InputDecoration(
                      hintText: 'Search a location...',
                      hintStyle: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      suffixIcon: Icon(
                        Icons.search,
                        size: 22,
                        weight: 40,
                      ),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                    onTap: () {
                      showGoogleAutoComplete();
                    },
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: 8,
                    right: 8,
                  ),
                  child: CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Icon(
                        Icons.my_location,
                        color: Colors.white,
                      )),
                ),
              ),
              // const Align(
              //   alignment: Alignment.bottomLeft,
              //   child: Padding(
              //     padding: EdgeInsets.only(
              //       bottom: 8,
              //       left: 8,
              //     ),
              //     child: CircleAvatar(
              //         backgroundColor: Colors.white,
              //         child: Icon(
              //           Icons.notifications,
              //           color: Colors.green,
              //         )),
              //   ),
              // )
            ]),
    );
  }
}
