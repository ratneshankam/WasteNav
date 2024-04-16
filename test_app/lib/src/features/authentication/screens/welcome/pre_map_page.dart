// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:test_app/src/constants/api_key.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// // class MapPage extends StatefulWidget {
// //   const MapPage({super.key});

// //   @override
// //   State<MapPage> createState() => _MapPageState();
// // }

// // class _MapPageState extends State<MapPage> {
// //   Location _locationController = new Location();

// //   final Completer<GoogleMapController> _mapController =
// //       Completer<GoogleMapController>();

// //   static const LatLng _pGooglePlex =
// //       LatLng(18.466630353721346, 73.83658948483483);
// //   static const LatLng _pApplePark = LatLng(18.4480873550439, 73.85866507930936);
// //   LatLng? _currentP = null;

// //   Map<PolylineId, Polyline> polylines = {};

// //   @override
// //   void initState() {
// //     super.initState();
// //     getLocationUpdates().then(
// //       (_) => {
// //         getPolylinePoints().then((coordinates) => {
// //               generatePolyLineFromPoints(coordinates),
// //             }),
// //       },
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       body: _currentP == null
// //           ? const Center(
// //               child: Text("Loading..."),
// //             )
// //           : GoogleMap(
// //               onMapCreated: ((GoogleMapController controller) =>
// //                   _mapController.complete(controller)),
// //               initialCameraPosition: const CameraPosition(
// //                 target: _pGooglePlex,
// //                 zoom: 13,
// //               ),
// //               markers: {
// //                 Marker(
// //                   markerId: const MarkerId("_currentLocation"),
// //                   icon: BitmapDescriptor.defaultMarker,
// //                   position: _currentP!,
// //                 ),
// //                 const Marker(
// //                     markerId: MarkerId("_sourceLocation"),
// //                     icon: BitmapDescriptor.defaultMarker,
// //                     position: _pGooglePlex),
// //                 const Marker(
// //                     markerId: MarkerId("_destionationLocation"),
// //                     icon: BitmapDescriptor.defaultMarker,
// //                     position: _pApplePark)
// //               },
// //               polylines: Set<Polyline>.of(polylines.values),
// //             ),
// //     );
// //   }

// //   Future<void> _cameraToPosition(LatLng pos) async {
// //     final GoogleMapController controller = await _mapController.future;
// //     CameraPosition _newCameraPosition = CameraPosition(
// //       target: pos,
// //       zoom: 13,
// //     );
// //     await controller.animateCamera(
// //       CameraUpdate.newCameraPosition(_newCameraPosition),
// //     );
// //   }

// //   Future<void> getLocationUpdates() async {
// //     bool _serviceEnabled;
// //     PermissionStatus _permissionGranted;

// //     _serviceEnabled = await _locationController.serviceEnabled();
// //     if (_serviceEnabled) {
// //       _serviceEnabled = await _locationController.requestService();
// //     } else {
// //       return;
// //     }

// //     _permissionGranted = await _locationController.hasPermission();
// //     if (_permissionGranted == PermissionStatus.denied) {
// //       _permissionGranted = await _locationController.requestPermission();
// //       if (_permissionGranted != PermissionStatus.granted) {
// //         return;
// //       }
// //     }

// //     _locationController.onLocationChanged
// //         .listen((LocationData currentLocation) {
// //       if (currentLocation.latitude != null &&
// //           currentLocation.longitude != null) {
// //         setState(() {
// //           _currentP =
// //               LatLng(currentLocation.latitude!, currentLocation.longitude!);
// //           _cameraToPosition(_currentP!);
// //         });
// //       }
// //     });
// //   }

// //   Future<List<LatLng>> getPolylinePoints() async {
// //     List<LatLng> polylineCoordinates = [];
// //     PolylinePoints polylinePoints = PolylinePoints();
// //     PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
// //       GOOGLE_MAPS_API_KEY,
// //       PointLatLng(_pGooglePlex.latitude, _pGooglePlex.longitude),
// //       PointLatLng(_pApplePark.latitude, _pApplePark.longitude),
// //       travelMode: TravelMode.driving,
// //     );
// //     if (result.points.isNotEmpty) {
// //       result.points.forEach((PointLatLng point) {
// //         polylineCoordinates.add(LatLng(point.latitude, point.longitude));
// //       });
// //     } else {
// //       print(result.errorMessage);
// //     }
// //     return polylineCoordinates;
// //   }

// //   void generatePolyLineFromPoints(List<LatLng> polylineCoordinates) async {
// //     PolylineId id = PolylineId("poly");
// //     Polyline polyline = Polyline(
// //         polylineId: id,
// //         color: Colors.black,
// //         points: polylineCoordinates,
// //         width: 8);
// //     setState(() {
// //       polylines[id] = polyline;
// //     });
// //   }
// // }

// class MapPage extends StatefulWidget {
//   const MapPage({Key? key}) : super(key: key);

//   @override
//   State<MapPage> createState() => _MapPageState();
// }

// class _MapPageState extends State<MapPage> {
//   final Location _locationController = Location();
//   final TextEditingController _searchController = TextEditingController();

//   // Location _locationController = new Location();

//   final Completer<GoogleMapController> _mapController =
//       Completer<GoogleMapController>();

//   static const LatLng _pGooglePlex =
//       LatLng(18.466630353721346, 73.83658948483483);
//   static const LatLng _pApplePark = LatLng(18.4480873550439, 73.85866507930936);
//   LatLng? _currentP = null;

//   Map<PolylineId, Polyline> polylines = {};

//   @override
//   void initState() {
//     super.initState();
//     getLocationUpdates().then(
//       (_) => {
//         getPolylinePoints().then((coordinates) => {
//               generatePolyLineFromPoints(coordinates),
//             }),
//       },
//     );
//   }

//   // Your existing code...
//   // final Completer<GoogleMapController> _mapController =
//   //     Completer<GoogleMapController>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: _currentP == null
//           ? const Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SpinKitFadingCircle(
//                   color: Color.fromARGB(255, 35, 141, 38),
//                   size: 80.0,
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text("Loading...")
//               ],
//             )
//           : Stack(
//               children: [
//                 GoogleMap(
//                   onMapCreated: ((GoogleMapController controller) =>
//                       _mapController.complete(controller)),
//                   initialCameraPosition: const CameraPosition(
//                     target: _pGooglePlex,
//                     zoom: 13,
//                   ),
//                   markers: {
//                     Marker(
//                       markerId: const MarkerId("_currentLocation"),
//                       icon: BitmapDescriptor.defaultMarker,
//                       position: _currentP!,
//                     ),
//                     const Marker(
//                         markerId: MarkerId("_sourceLocation"),
//                         icon: BitmapDescriptor.defaultMarker,
//                         position: _pGooglePlex),
//                     const Marker(
//                         markerId: MarkerId("_destionationLocation"),
//                         icon: BitmapDescriptor.defaultMarker,
//                         position: _pApplePark)
//                   },
//                   polylines: Set<Polyline>.of(polylines.values),
//                 ),
//                 Positioned(
//                   top: 20,
//                   left: 20,
//                   right: 20,
//                   child: Container(
//                     padding: EdgeInsets.symmetric(horizontal: 20),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(8),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.5),
//                           spreadRadius: 2,
//                           blurRadius: 7,
//                           offset: Offset(0, 3),
//                         ),
//                       ],
//                     ),
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: TextField(
//                             controller: _searchController,
//                             decoration: InputDecoration(
//                               hintText: 'Search location...',
//                               border: InputBorder.none,
//                             ),
//                           ),
//                         ),
//                         IconButton(
//                           icon: Icon(Icons.search),
//                           onPressed: () {
//                             searchLocation(_searchController.text);
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//     );
//   }

//   void searchLocation(String query) async {
//     if (query.isEmpty) return;

//     // Perform search using geocoding services
//     // Replace the logic below with your preferred geocoding service
//     // This is just a dummy implementation
//     LatLng? result = await geocodeLocation(query);

//     if (result != null) {
//       _cameraToPosition(result);
//     } else {
//       // Handle error or display message
//       const Center(
//         child: Text("Loading..."),
//       );
//     }
//   }

//   Future<LatLng?> geocodeLocation(String query) async {
//     // Dummy implementation
//     // Replace this with your preferred geocoding service
//     return LatLng(18.466630353721346, 73.83658948483483);
//   }

//   // Your existing code...

//   Future<void> _cameraToPosition(LatLng pos) async {
//     final GoogleMapController controller = await _mapController.future;
//     CameraPosition _newCameraPosition = CameraPosition(
//       target: pos,
//       zoom: 13,
//     );
//     await controller.animateCamera(
//       CameraUpdate.newCameraPosition(_newCameraPosition),
//     );
//   }

//   Future<void> getLocationUpdates() async {
//     bool _serviceEnabled;
//     PermissionStatus _permissionGranted;

//     _serviceEnabled = await _locationController.serviceEnabled();
//     if (_serviceEnabled) {
//       _serviceEnabled = await _locationController.requestService();
//     } else {
//       return;
//     }

//     _permissionGranted = await _locationController.hasPermission();
//     if (_permissionGranted == PermissionStatus.denied) {
//       _permissionGranted = await _locationController.requestPermission();
//       if (_permissionGranted != PermissionStatus.granted) {
//         return;
//       }
//     }

//     _locationController.onLocationChanged
//         .listen((LocationData currentLocation) {
//       if (currentLocation.latitude != null &&
//           currentLocation.longitude != null) {
//         setState(() {
//           _currentP =
//               LatLng(currentLocation.latitude!, currentLocation.longitude!);
//           _cameraToPosition(_currentP!);
//         });
//       }
//     });
//   }

//   Future<List<LatLng>> getPolylinePoints() async {
//     List<LatLng> polylineCoordinates = [];
//     PolylinePoints polylinePoints = PolylinePoints();
//     PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
//       GOOGLE_MAPS_API_KEY,
//       PointLatLng(_pGooglePlex.latitude, _pGooglePlex.longitude),
//       PointLatLng(_pApplePark.latitude, _pApplePark.longitude),
//       travelMode: TravelMode.driving,
//     );
//     if (result.points.isNotEmpty) {
//       result.points.forEach((PointLatLng point) {
//         polylineCoordinates.add(LatLng(point.latitude, point.longitude));
//       });
//     } else {
//       print(result.errorMessage);
//     }
//     return polylineCoordinates;
//   }

//   void generatePolyLineFromPoints(List<LatLng> polylineCoordinates) async {
//     PolylineId id = PolylineId("poly");
//     Polyline polyline = Polyline(
//         polylineId: id,
//         color: Colors.black,
//         points: polylineCoordinates,
//         width: 8);
//     setState(() {
//       polylines[id] = polyline;
//     });
//   }
// }
