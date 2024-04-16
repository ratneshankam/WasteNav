import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_maps_webservice/places.dart';
// import 'package:green_taxi/views/my_profile.dart';



import 'package:test_app/src/constants/utils/app_colors.dart';
import 'package:test_app/src/constants/utils/app_constants.dart';
import 'package:geocoding/geocoding.dart' as geoCoding;
import 'dart:ui' as ui;

import 'package:test_app/src/features/authentication/screens/welcome/polyline_handler.dart';



class TaxiMapScreen extends StatefulWidget {
  const TaxiMapScreen({Key? key}) : super(key: key);

  @override
  State<TaxiMapScreen> createState() => _TaxiMapScreenState();
}

class _TaxiMapScreenState extends State<TaxiMapScreen> {
  String? _mapStyle;


  late LatLng destination;
  late LatLng source;
  final Set<Polyline> _polyline = {};
  Set<Marker> markers = Set<Marker>();
  List<String> list = <String>[
    '**** **** **** 8789',
    '**** **** **** 8921',
    '**** **** **** 1233',
    '**** **** **** 4352'
  ];

  @override
  void initState() {
    super.initState();

    

    loadCustomMarker();
  }

  String dropdownValue = '**** **** **** 8789';
  final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  GoogleMapController? myMapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: GoogleMap(
              markers: markers,
              polylines: polyline,
              zoomControlsEnabled: false,
              onMapCreated: (GoogleMapController controller) {
                myMapController = controller;

                myMapController!.setMapStyle(_mapStyle);
              },
              initialCameraPosition: _kGooglePlex,
            ),
          ),
          buildProfileTile(),
          buildTextField(),
          showSourceField ? buildTextFieldForSource() : Container(),
          buildCurrentLocationIcon(),
          buildNotificationIcon(),
          buildBottomSheet(),
        ],
      ),
    );
  }
  Widget textWidget({required String text,double fontSize = 12, FontWeight fontWeight = FontWeight.normal,Color color = Colors.black}){
  return Text(text, style: TextStyle(fontSize: fontSize,fontWeight: fontWeight,color: color),);
}
  Widget buildProfileTile() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: 
          Container(
              width: Get.width,
              height: Get.width * 0.5,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(color: Colors.white70),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image:DecorationImage(
                                image: AssetImage('assets/person.png'),
                                fit: BoxFit.fill),
                  ),),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'Good Morning, ',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14)),
                          TextSpan(
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                        ]),
                      ),
                      Text(
                        "Where are you going?",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      )
                    ],
                  )
                ],
              ),
            ),
    );
  }

  TextEditingController destinationController = TextEditingController();
  TextEditingController sourceController = TextEditingController();

  bool showSourceField = false;
   Future<Prediction?> showGoogleAutoComplete(BuildContext context) async {
    Prediction? p = await PlacesAutocomplete.show(
      offset: 0,
      radius: 1000,
      strictbounds: false,
      region: "pk",
      language: "en",
      context: context,
      mode: Mode.overlay,
      apiKey: AppConstants.kGoogleApiKey,
      components: [new Component(Component.country, "pk")],
      types: [],
      hint: "Search City",
    );

    return p;
  }
  Widget buildTextField() {
    return Positioned(
      top: 170,
      left: 20,
      right: 20,
      child: Container(
        width: Get.width,
        height: 50,
        padding: EdgeInsets.only(left: 15),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 4,
                  blurRadius: 10)
            ],
            borderRadius: BorderRadius.circular(8)),
        child: TextFormField(
          controller: destinationController,
          readOnly: true,
          onTap: () async {
            Prediction? p =
                await showGoogleAutoComplete(context);

            String selectedPlace = p!.description!;

            destinationController.text = selectedPlace;

            List<geoCoding.Location> locations =
                await geoCoding.locationFromAddress(selectedPlace);

            destination =
                LatLng(locations.first.latitude, locations.first.longitude);

            markers.add(Marker(
              markerId: MarkerId(selectedPlace),
              infoWindow: InfoWindow(
                title: 'Destination: $selectedPlace',
              ),
              position: destination,
              icon: BitmapDescriptor.fromBytes(markIcons),
            ));

            myMapController!.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(target: destination, zoom: 14)
                //17 is new zoom level
                ));

            setState(() {
              showSourceField = true;
            });
          },
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecoration(
            hintText: 'Search for a destination',
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Icon(
                Icons.search,
              ),
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget buildTextFieldForSource() {
    return Positioned(
      top: 230,
      left: 20,
      right: 20,
      child: Container(
        width: Get.width,
        height: 50,
        padding: EdgeInsets.only(left: 15),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 4,
                  blurRadius: 10)
            ],
            borderRadius: BorderRadius.circular(8)),
        child: TextFormField(
          controller: sourceController,
          readOnly: true,
          onTap: () async {
            buildSourceSheet();
          },
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecoration(
            hintText: 'From:',
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Icon(
                Icons.search,
              ),
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget buildCurrentLocationIcon() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30, right: 8),
        child: CircleAvatar(
          radius: 20,
          backgroundColor: Colors.green,
          child: Icon(
            Icons.my_location,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget buildNotificationIcon() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30, left: 8),
        child: CircleAvatar(
          radius: 20,
          backgroundColor: Colors.white,
          child: Icon(
            Icons.notifications,
            color: Color(0xffC3CDD6),
          ),
        ),
      ),
    );
  }

  Widget buildBottomSheet() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: Get.width * 0.8,
        height: 25,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 4,
                  blurRadius: 10)
            ],
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(12), topLeft: Radius.circular(12))),
        child: Center(
          child: Container(
            width: Get.width * 0.6,
            height: 4,
            color: Colors.black45,
          ),
        ),
      ),
    );
  }

  buildDrawerItem(
      {required String title,
      required Function onPressed,
      Color color = Colors.black,
      double fontSize = 20,
      FontWeight fontWeight = FontWeight.w700,
      double height = 45,
      bool isVisible = false}) {
    return SizedBox(
      height: height,
      child: ListTile(
        contentPadding: EdgeInsets.all(0),
        // minVerticalPadding: 0,
        dense: true,
        onTap: () => onPressed(),
        title: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: fontSize, fontWeight: fontWeight, color: color),
            ),
            const SizedBox(
              width: 5,
            ),
            isVisible
                ? CircleAvatar(
                    backgroundColor: AppColors.greenColor,
                    radius: 15,
                    child: Text(
                      '1',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }

 
  late Uint8List markIcons;

  loadCustomMarker() async {
    markIcons = await loadAsset('assets/dest_marker.png', 100);
  }

  Future<Uint8List> loadAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  void drawPolyline(String placeId) {
    _polyline.clear();
    _polyline.add(Polyline(
      polylineId: PolylineId(placeId),
      visible: true,
      points: [source, destination],
      color: AppColors.greenColor,
      width: 5,
    ));
  }
  Future<LatLng> buildLatLngFromAddress(String place) async {
    List<geoCoding.Location> locations =
        await geoCoding.locationFromAddress(place);
    return LatLng(locations.first.latitude, locations.first.longitude);
  }

  void buildSourceSheet() {
    Get.bottomSheet(Container(
      width: Get.width,
      height: Get.height * 0.5,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8), topRight: Radius.circular(8)),
          color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            "Select Your Location",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Home Address",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () async {
              Get.back();
        
              if (markers.length >= 2) {
                markers.remove(markers.last);
              }
          
              await getPolylines(source, destination);

              // drawPolyline(place);

              myMapController!.animateCamera(CameraUpdate.newCameraPosition(
                  CameraPosition(target: source, zoom: 14)));
              setState(() {});

              buildRideConfirmationSheet();
            },
            child: Container(
              width: Get.width,
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        spreadRadius: 4,
                        blurRadius: 10)
                  ]),
              child: const Row(
                children: [
                  Text(
                    "",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Business Address",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () async {
              Get.back();
            
              if (markers.length >= 2) {
                markers.remove(markers.last);
              }
           
              await getPolylines(source, destination);

              // drawPolyline(place);

              myMapController!.animateCamera(CameraUpdate.newCameraPosition(
                  CameraPosition(target: source, zoom: 14)));
              setState(() {});

              buildRideConfirmationSheet();
            },
            child: Container(
              width: Get.width,
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        spreadRadius: 4,
                        blurRadius: 10)
                  ]),
              child: Row(
                children: [
                  Text(
                    "",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () async {
              Get.back();
              Prediction? p =
                  await showGoogleAutoComplete(context);

              String place = p!.description!;

              sourceController.text = place;

              source = await buildLatLngFromAddress(place);

              if (markers.length >= 2) {
                markers.remove(markers.last);
              }
              markers.add(Marker(
                  markerId: MarkerId(place),
                  infoWindow: InfoWindow(
                    title: 'Source: $place',
                  ),
                  position: source));

              await getPolylines(source, destination);

              // drawPolyline(place);

              myMapController!.animateCamera(CameraUpdate.newCameraPosition(
                  CameraPosition(target: source, zoom: 14)));
              setState(() {});
              buildRideConfirmationSheet();
            },
            child: Container(
              width: Get.width,
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        spreadRadius: 4,
                        blurRadius: 10)
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Search for Address",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

  buildRideConfirmationSheet() {
    Get.bottomSheet(Container(
      width: Get.width,
      height: Get.height * 0.4,
      padding: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(12), topLeft: Radius.circular(12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              width: Get.width * 0.2,
              height: 8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: Colors.grey),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          textWidget(
              text: 'Select an option:',
              fontSize: 18,
              fontWeight: FontWeight.bold),
          const SizedBox(
            height: 20,
          ),
          buildDriversList(),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: buildPaymentCardWidget()),
                MaterialButton(
                  onPressed: () {},
                  child: textWidget(
                    text: 'Confirm',
                    color: Colors.white,
                  ),
                  color: AppColors.greenColor,
                  shape: StadiumBorder(),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }

  int selectedRide = 0;

  buildDriversList() {
    return Container(
      height: 90,
      width: Get.width,
      child: StatefulBuilder(builder: (context, set) {
        return ListView.builder(
          itemBuilder: (ctx, i) {
            return InkWell(
              onTap: () {
                set(() {
                  selectedRide = i;
                });
              },
              child: buildDriverCard(selectedRide == i),
            );
          },
          itemCount: 3,
          scrollDirection: Axis.horizontal,
        );
      }),
    );
  }

  buildDriverCard(bool selected) {
    return Container(
      margin: EdgeInsets.only(right: 8, left: 8, top: 4, bottom: 4),
      height: 85,
      width: 165,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: selected
                    ? Color(0xff2DBB54).withOpacity(0.2)
                    : Colors.grey.withOpacity(0.2),
                offset: Offset(0, 5),
                blurRadius: 5,
                spreadRadius: 1)
          ],
          borderRadius: BorderRadius.circular(12),
          color: selected ? Color(0xff2DBB54) : Colors.grey),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textWidget(
                    text: 'Standard',
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
                textWidget(
                    text: '\$9.90',
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
                textWidget(
                    text: '3 MIN',
                    color: Colors.white.withOpacity(0.8),
                    fontWeight: FontWeight.normal,
                    fontSize: 12),
              ],
            ),
          ),
          Positioned(
              right: -20,
              top: 0,
              bottom: 0,
              child: Image.asset('assets/Mask Group 2.png'))
        ],
      ),
    );
  }

  buildPaymentCardWidget() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/visa.png',
            width: 40,
          ),
          SizedBox(
            width: 10,
          ),
          DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(Icons.keyboard_arrow_down),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                dropdownValue = value!;
              });
            },
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: textWidget(text: value),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
