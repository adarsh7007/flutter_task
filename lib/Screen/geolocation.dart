// import 'package:flutter/material.dart';
// import 'package:location/location.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:geocoding/geocoding.dart';

// import 'dart:async';

// class geolocationn extends StatefulWidget {
//   const geolocationn({Key? key}) : super(key: key);
//   @override
//   _HomepageState createState() => _HomepageState();
// }

// class _HomepageState extends State<geolocationn> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   late Timer countdownTimer;
//   void startTimer() {
//     Position position;
//     // Add these lines to launch timer on start of the app
//     countdownTimer = Timer.periodic(
//         Duration(seconds: 1),
//         (Timer t) => setState(() async {
//               position = await _getGeoLocationPosition();
//               location =
//                   'Lat: ${position.latitude} , Long: ${position.longitude}';
//               GetAddressFromLatLong(position);
//             }));
//   }

//   @override
//   void dispose() {
//     // Add these to dispose to cancel timer when user leaves the app

//     countdownTimer.cancel();
//     var position;
//     position.dipose();
//     super.dispose();
//   }

//   String location = 'Null, Press Button';
//   String Address = 'search';
//   Future<Position> _getGeoLocationPosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       await Geolocator.openLocationSettings();
//       return Future.error('Location services are disabled.');
//     }
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return Future.error('Location permissions are denied');
//       }
//     }
//     if (permission == LocationPermission.deniedForever) {
//       return Future.error(
//           'Location permissions are permanently denied, we cannot request permissions.');
//     }
//     return await Geolocator.getCurrentPosition();
//   }

//   Future<void> GetAddressFromLatLong(Position position) async {
//     List<Placemark> placemarks =
//         await placemarkFromCoordinates(position.latitude, position.longitude);
//     print(placemarks);
//     Placemark place = placemarks[0];
//     Address =
//         '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Coordinates Points',
//               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Text(
//               location,
//               style: TextStyle(color: Colors.black, fontSize: 16),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Text(
//               'ADDRESS',
//               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Text('${Address}'),
//             ElevatedButton(onPressed: startTimer, child: Text('Get Location')),
//             ElevatedButton(
//                 onPressed: () {
//                   dispose();
//                 },
//                 child: Text('stop'))
//           ],
//         ),
//       ),
//     );
//   }

//   createInterstitialAd() {}
// }

// // import 'dart:async';

// // import 'package:flutter/material.dart';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';
// // import 'package:location/location.dart';

// // class geolocation extends StatefulWidget {
// //   @override
// //   _MyHomePageState createState() => _MyHomePageState();
// // }

// // class _MyHomePageState extends State<geolocation> {
// //   Completer<GoogleMapController> _controller = Completer();

// //   static final CameraPosition _kGooglePlex = CameraPosition(
// //     target: LatLng(37.42796133580664, -122.085749655962),
// //     zoom: 14.4746,
// //   );

// //   static final CameraPosition _kLake = CameraPosition(
// //       bearing: 192.8334901395799,
// //       target: LatLng(37.43296265331129, -122.08832357078792),
// //       tilt: 59.440717697143555,
// //       zoom: 19.151926040649414);

// //   @override
// //   Widget build(BuildContext context) {
// //     return new Scaffold(
// //       body: GoogleMap(
// //         mapType: MapType.hybrid,
// //         initialCameraPosition: _kGooglePlex,
// //         onMapCreated: (GoogleMapController controller) {
// //           _controller.complete(controller);
// //         },
// //       ),
// //       floatingActionButton: FloatingActionButton.extended(
// //         onPressed: _goToTheLake,
// //         label: Text('To the lake!'),
// //         icon: Icon(Icons.directions_boat),
// //       ),
// //     );
// //   }

// //   Future<void> _goToTheLake() async {
// //     final GoogleMapController controller = await _controller.future;
// //     controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
// //   }
// // }

// // import 'package:flutter/material.dart';
// // import 'package:flutter/foundation.dart';
// // import 'package:flutter/gestures.dart';
// // import 'dart:typed_data';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';
// // import 'package:geolocator/geolocator.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';

// // // This page shows a Google Map plugin with all stations (HvD and Total). The markers are pulled from a Firebase database.

// // class geolocation extends StatefulWidget {
// //   @override
// //   _StationsMap createState() => _StationsMap();
// // }

// // class _StationsMap extends State<geolocation> {
// //   bool _isLocationGranted = false;

// //   var currentLocation;

// //   late GoogleMapController mapController;

// //   Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

// //   get MapUtils => null;

// // // Below function initiates all HvD stations and shows them as markers on the map. It also generates a Bottom Sheet for each location with corresponding information.

// //   void initMarkerHvD(specify, specifyId) async {
// //     var markerIdVal = specifyId;
// //     // final Uint8List markerHvD = await getBytesFromAsset('images/Pin-HvD.JPG', 70);
// //     final MarkerId markerId = MarkerId(markerIdVal);
// //     final Marker marker = Marker(
// //       markerId: markerId,
// //       onTap: () {
// //         showModalBottomSheet(
// //             context: context,
// //             builder: (context) => SingleChildScrollView(
// //                   child: Container(
// //                     padding: EdgeInsets.only(
// //                         bottom: MediaQuery.of(context).viewInsets.bottom),
// //                     child: Container(
// //                       color: Color(0xff757575),
// //                       child: Container(
// //                         padding: EdgeInsets.all(20.0),
// //                         decoration: BoxDecoration(
// //                             color: Colors.white,
// //                             borderRadius: BorderRadius.only(
// //                                 topLeft: const Radius.circular(20.0),
// //                                 topRight: const Radius.circular(20.0))),
// //                         child: Column(
// //                           crossAxisAlignment: CrossAxisAlignment.stretch,
// //                           children: [
// //                             Text(
// //                               specify['stationName'],
// //                               style: TextStyle(
// //                                   fontWeight: FontWeight.bold, fontSize: 16),
// //                               textAlign: TextAlign.center,
// //                             ),
// //                             SizedBox(height: 10),
// //                             Text(specify['stationAddress']),
// //                             Text(specify['stationZIP'] +
// //                                 ' ' +
// //                                 specify['stationCity']),
// //                             SizedBox(height: 20),
// //                             ElevatedButton(
// //                                 child: Text(
// //                                   'Navigeer naar locatie',
// //                                   style: TextStyle(
// //                                     color: Colors.white,
// //                                   ),
// //                                 ),
// //                                 onPressed: () {
// //                                   MapUtils.openMap(
// //                                       specify['stationLocation'].latitude,
// //                                       specify['stationLocation'].longitude);
// //                                 }),
// //                           ],
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                 ));
// //       },
// //       position: LatLng(specify['stationLocation'].latitude,
// //           specify['stationLocation'].longitude),
// //       infoWindow: InfoWindow(),
// //       // icon: BitmapDescriptor.fromBytes(markerHvD),
// //     );
// //     setState(() {
// //       markers[markerId] = marker;
// //     });
// //   }

// // // Below function initiates all Total stations and shows them as markers on the map. It also generates a Bottom Sheet for each location with corresponding information.

// //   void initMarkerTotal(specify, specifyId) async {
// //     var markerIdVal = specifyId;
// //     // final Uint8List markerTotal = await getBytesFromAsset('images/Pin-Total.JPG', 70);
// //     final MarkerId markerId = MarkerId(markerIdVal);
// //     final Marker marker = Marker(
// //       markerId: markerId,
// //       onTap: () {
// //         showModalBottomSheet(
// //             context: context,
// //             builder: (context) => SingleChildScrollView(
// //                   child: Container(
// //                     padding: EdgeInsets.only(
// //                         bottom: MediaQuery.of(context).viewInsets.bottom),
// //                     child: Container(
// //                       color: Color(0xff757575),
// //                       child: Container(
// //                         padding: EdgeInsets.all(20.0),
// //                         decoration: BoxDecoration(
// //                             color: Colors.white,
// //                             borderRadius: BorderRadius.only(
// //                                 topLeft: const Radius.circular(20.0),
// //                                 topRight: const Radius.circular(20.0))),
// //                         child: Column(
// //                           crossAxisAlignment: CrossAxisAlignment.stretch,
// //                           children: [
// //                             Text(
// //                               specify['stationName'],
// //                               style: TextStyle(
// //                                   fontWeight: FontWeight.bold, fontSize: 16),
// //                               textAlign: TextAlign.center,
// //                             ),
// //                             SizedBox(height: 10),
// //                             Text(specify['stationAddress']),
// //                             Text(specify['stationZIP'] +
// //                                 ' ' +
// //                                 specify['stationCity']),
// //                             SizedBox(height: 20),
// //                             ElevatedButton(
// //                                 child: Text(
// //                                   'Navigeer naar locatie',
// //                                   style: TextStyle(
// //                                     color: Colors.white,
// //                                   ),
// //                                 ),
// //                                 onPressed: () {
// //                                   MapUtils.openMap(
// //                                       specify['stationLocation'].latitude,
// //                                       specify['stationLocation'].longitude);
// //                                 }),
// //                           ],
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                 ));
// //       },
// //       position: LatLng(specify['stationLocation'].latitude,
// //           specify['stationLocation'].longitude),
// //       infoWindow: InfoWindow(),
// //       // icon: BitmapDescriptor.fromBytes(markerTotal),
// //     );
// //     setState(() {
// //       markers[markerId] = marker;
// //     });
// //   }

// // // Below functions pulls all HvD markers from the database.

// //   getMarkerDataHvD() async {
// //     FirebaseFirestore.instance
// //         .collection('hvd-stations')
// //         .get()
// //         .then((myMarkers) {
// //       if (myMarkers.docs.isNotEmpty) {
// //         for (int i = 0; i < myMarkers.docs.length; i++) {
// //           initMarkerHvD(myMarkers.docs[i].data(), myMarkers.docs[i].id);
// //         }
// //       }
// //     });
// //   }

// // // Below function pulls all Total markers from the database.

// //   getMarkerDataTotal() async {
// //     FirebaseFirestore.instance
// //         .collection('total-stations')
// //         .get()
// //         .then((myMarkers) {
// //       if (myMarkers.docs.isNotEmpty) {
// //         for (int i = 0; i < myMarkers.docs.length; i++) {
// //           initMarkerTotal(myMarkers.docs[i].data(), myMarkers.docs[i].id);
// //         }
// //       }
// //     });
// //   }

// // // Below function initiates all previous functions on the page. This happens when the user navigates to the page.

// //   void initState() {
// //     getMarkerDataHvD();
// //     getMarkerDataTotal();
// //     super.initState();
// //     Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
// //         .then((currloc) {
// //       setState(() {
// //         currentLocation = currloc;
// //         _isLocationGranted = true;
// //       });
// //     });
// //   }

// // // Below function is used to display all previous functions to the page.

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: Scaffold(
// //         body: Stack(
// //           children: <Widget>[
// //             GoogleMap(
// //               onMapCreated: onMapCreated,
// //               markers: Set<Marker>.of(markers.values),
// //               gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
// //                 new Factory<OneSequenceGestureRecognizer>(
// //                   () => new EagerGestureRecognizer(),
// //                 ),
// //               ].toSet(),
// //               mapToolbarEnabled: false,
// //               zoomGesturesEnabled: true,
// //               zoomControlsEnabled: false,
// //               scrollGesturesEnabled: true,
// //               myLocationEnabled: _isLocationGranted,
// //               myLocationButtonEnabled: true,
// //               initialCameraPosition: CameraPosition(
// //                 target: LatLng(51.8876176, 5.4278765),
// //                 zoom: 12.0,
// //               ),
// //             )
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   void onMapCreated(controller) {
// //     mapController = controller;
// //     mapController.moveCamera(CameraUpdate.newCameraPosition(currentLocation));
// //   }
// // }

// // import 'package:flutter/material.dart';
// // import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// // import 'package:geocoding/geocoding.dart';
// // import 'package:geolocator/geolocator.dart';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';

// // import 'dart:math' show cos, sqrt, asin;

// // class geolocation extends StatefulWidget {
// //   @override
// //   _MapViewState createState() => _MapViewState();
// // }

// // class _MapViewState extends State<geolocation> {
// //   CameraPosition _initialLocation = CameraPosition(target: LatLng(0.0, 0.0));
// //   late GoogleMapController mapController;

// //   late Position _currentPosition;
// //   String _currentAddress = '';

// //   final startAddressController = TextEditingController();
// //   final destinationAddressController = TextEditingController();

// //   final startAddressFocusNode = FocusNode();
// //   final desrinationAddressFocusNode = FocusNode();

// //   String _startAddress = '';
// //   String _destinationAddress = '';
// //   String? _placeDistance;

// //   Set<Marker> markers = {};

// //   late PolylinePoints polylinePoints;
// //   Map<PolylineId, Polyline> polylines = {};
// //   List<LatLng> polylineCoordinates = [];

// //   final _scaffoldKey = GlobalKey<ScaffoldState>();

// //   Widget _textField({
// //     required TextEditingController controller,
// //     required FocusNode focusNode,
// //     required String label,
// //     required String hint,
// //     required double width,
// //     required Icon prefixIcon,
// //     Widget? suffixIcon,
// //     required Function(String) locationCallback,
// //   }) {
// //     return Container(
// //       width: width * 0.8,
// //       child: TextField(
// //         onChanged: (value) {
// //           locationCallback(value);
// //         },
// //         controller: controller,
// //         focusNode: focusNode,
// //         decoration: new InputDecoration(
// //           prefixIcon: prefixIcon,
// //           suffixIcon: suffixIcon,
// //           labelText: label,
// //           filled: true,
// //           fillColor: Colors.white,
// //           enabledBorder: OutlineInputBorder(
// //             borderRadius: BorderRadius.all(
// //               Radius.circular(10.0),
// //             ),
// //             borderSide: BorderSide(
// //               color: Colors.grey.shade400,
// //               width: 2,
// //             ),
// //           ),
// //           focusedBorder: OutlineInputBorder(
// //             borderRadius: BorderRadius.all(
// //               Radius.circular(10.0),
// //             ),
// //             borderSide: BorderSide(
// //               color: Colors.blue.shade300,
// //               width: 2,
// //             ),
// //           ),
// //           contentPadding: EdgeInsets.all(15),
// //           hintText: hint,
// //         ),
// //       ),
// //     );
// //   }

// //   // Method for retrieving the current location
// //   _getCurrentLocation() async {
// //     bool serviceEnabled;
// //     LocationPermission permission;
// //     // Test if location services are enabled.
// //     serviceEnabled = await Geolocator.isLocationServiceEnabled();
// //     if (!serviceEnabled) {
// //       // Location services are not enabled don't continue
// //       // accessing the position and request users of the
// //       // App to enable the location services.
// //       await Geolocator.openLocationSettings();
// //       return Future.error('Location services are disabled.');
// //     }
// //     permission = await Geolocator.checkPermission();
// //     if (permission == LocationPermission.denied) {
// //       permission = await Geolocator.requestPermission();
// //       if (permission == LocationPermission.denied) {
// //         // Permissions are denied, next time you could try
// //         // requesting permissions again (this is also where
// //         // Android's shouldShowRequestPermissionRationale
// //         // returned true. According to Android guidelines
// //         // your App should show an explanatory UI now.
// //         return Future.error('Location permissions are denied');
// //       }
// //     }
// //     if (permission == LocationPermission.deniedForever) {
// //       // Permissions are denied forever, handle appropriately.
// //       return Future.error(
// //           'Location permissions are permanently denied, we cannot request permissions.');
// //     }
// //     // When we reach here, permissions are granted and we can
// //     // continue accessing the position of the device.
// //     return await Geolocator.getCurrentPosition(
// //             desiredAccuracy: LocationAccuracy.high)
// //         .then((Position position) async {
// //       setState(() {
// //         _currentPosition = position;
// //         print(_currentPosition);
// //         mapController.animateCamera(
// //           CameraUpdate.newCameraPosition(
// //             CameraPosition(
// //               target: LatLng(position.latitude, position.longitude),
// //               zoom: 18.0,
// //             ),
// //           ),
// //         );
// //       });
// //       await _getAddress();
// //     }).catchError((e) {
// //       print(e);
// //     });
// //   }

// //   // Method for retrieving the address
// //   _getAddress() async {
// //     try {
// //       List<Placemark> p = await placemarkFromCoordinates(
// //           _currentPosition.latitude, _currentPosition.longitude);

// //       Placemark place = p[0];

// //       setState(() {
// //         _currentAddress =
// //             "${place.name}, ${place.locality}, ${place.postalCode}, ${place.country}";
// //         startAddressController.text = _currentAddress;
// //         _startAddress = _currentAddress;
// //       });
// //     } catch (e) {
// //       print(e);
// //     }
// //   }

// //   // Method for calculating the distance between two places
// //   Future<bool> _calculateDistance() async {
// //     try {
// //       // Retrieving placemarks from addresses
// //       List<Location> startPlacemark = await locationFromAddress(_startAddress);
// //       List<Location> destinationPlacemark =
// //           await locationFromAddress(_destinationAddress);

// //       // Use the retrieved coordinates of the current position,
// //       // instead of the address if the start position is user's
// //       // current position, as it results in better accuracy.
// //       double startLatitude = _startAddress == _currentAddress
// //           ? _currentPosition.latitude
// //           : startPlacemark[0].latitude;

// //       double startLongitude = _startAddress == _currentAddress
// //           ? _currentPosition.longitude
// //           : startPlacemark[0].longitude;

// //       double destinationLatitude = destinationPlacemark[0].latitude;
// //       double destinationLongitude = destinationPlacemark[0].longitude;

// //       String startCoordinatesString = '($startLatitude, $startLongitude)';
// //       String destinationCoordinatesString =
// //           '($destinationLatitude, $destinationLongitude)';

// //       // Start Location Marker
// //       Marker startMarker = Marker(
// //         markerId: MarkerId(startCoordinatesString),
// //         position: LatLng(startLatitude, startLongitude),
// //         infoWindow: InfoWindow(
// //           title: 'Start $startCoordinatesString',
// //           snippet: _startAddress,
// //         ),
// //         icon: BitmapDescriptor.defaultMarker,
// //       );

// //       // Destination Location Marker
// //       Marker destinationMarker = Marker(
// //         markerId: MarkerId(destinationCoordinatesString),
// //         position: LatLng(destinationLatitude, destinationLongitude),
// //         infoWindow: InfoWindow(
// //           title: 'Destination $destinationCoordinatesString',
// //           snippet: _destinationAddress,
// //         ),
// //         icon: BitmapDescriptor.defaultMarker,
// //       );

// //       // Adding the markers to the list
// //       markers.add(startMarker);
// //       markers.add(destinationMarker);

// //       print(
// //         'START COORDINATES: ($startLatitude, $startLongitude)',
// //       );
// //       print(
// //         'DESTINATION COORDINATES: ($destinationLatitude, $destinationLongitude)',
// //       );

// //       // Calculating to check that the position relative
// //       // to the frame, and pan & zoom the camera accordingly.
// //       double miny = (startLatitude <= destinationLatitude)
// //           ? startLatitude
// //           : destinationLatitude;
// //       double minx = (startLongitude <= destinationLongitude)
// //           ? startLongitude
// //           : destinationLongitude;
// //       double maxy = (startLatitude <= destinationLatitude)
// //           ? destinationLatitude
// //           : startLatitude;
// //       double maxx = (startLongitude <= destinationLongitude)
// //           ? destinationLongitude
// //           : startLongitude;

// //       double southWestLatitude = miny;
// //       double southWestLongitude = minx;

// //       double northEastLatitude = maxy;
// //       double northEastLongitude = maxx;

// //       // Accommodate the two locations within the
// //       // camera view of the map
// //       mapController.animateCamera(
// //         CameraUpdate.newLatLngBounds(
// //           LatLngBounds(
// //             northeast: LatLng(northEastLatitude, northEastLongitude),
// //             southwest: LatLng(southWestLatitude, southWestLongitude),
// //           ),
// //           100.0,
// //         ),
// //       );

// //       // Calculating the distance between the start and the end positions
// //       // with a straight path, without considering any route
// //       // double distanceInMeters = await Geolocator.bearingBetween(
// //       //   startLatitude,
// //       //   startLongitude,
// //       //   destinationLatitude,
// //       //   destinationLongitude,
// //       // );

// //       await _createPolylines(startLatitude, startLongitude, destinationLatitude,
// //           destinationLongitude);

// //       double totalDistance = 0.0;

// //       // Calculating the total distance by adding the distance
// //       // between small segments
// //       for (int i = 0; i < polylineCoordinates.length - 1; i++) {
// //         totalDistance += _coordinateDistance(
// //           polylineCoordinates[i].latitude,
// //           polylineCoordinates[i].longitude,
// //           polylineCoordinates[i + 1].latitude,
// //           polylineCoordinates[i + 1].longitude,
// //         );
// //       }

// //       setState(() {
// //         _placeDistance = totalDistance.toStringAsFixed(2);
// //         print('DISTANCE: $_placeDistance km');
// //       });

// //       return true;
// //     } catch (e) {
// //       print(e);
// //     }
// //     return false;
// //   }

// //   // Formula for calculating distance between two coordinates
// //   // https://stackoverflow.com/a/54138876/11910277
// //   double _coordinateDistance(lat1, lon1, lat2, lon2) {
// //     var p = 0.017453292519943295;
// //     var c = cos;
// //     var a = 0.5 -
// //         c((lat2 - lat1) * p) / 2 +
// //         c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
// //     return 12742 * asin(sqrt(a));
// //   }

// //   // Create the polylines for showing the route between two places
// //   _createPolylines(
// //     double startLatitude,
// //     double startLongitude,
// //     double destinationLatitude,
// //     double destinationLongitude,
// //   ) async {
// //     polylinePoints = PolylinePoints();
// //     PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
// //       'AIzaSyClDoEGvjHaialylYSzhGrzxQrsT_SLovY', // Google Maps API Key
// //       PointLatLng(startLatitude, startLongitude),
// //       PointLatLng(destinationLatitude, destinationLongitude),
// //       travelMode: TravelMode.transit,
// //     );

// //     if (result.points.isNotEmpty) {
// //       result.points.forEach((PointLatLng point) {
// //         polylineCoordinates.add(LatLng(point.latitude, point.longitude));
// //       });
// //     }

// //     PolylineId id = PolylineId('poly');
// //     Polyline polyline = Polyline(
// //       polylineId: id,
// //       color: Colors.red,
// //       points: polylineCoordinates,
// //       width: 3,
// //     );
// //     polylines[id] = polyline;
// //   }

// //   @override
// //   void initState() {
// //     super.initState();
// //     _getCurrentLocation();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     var height = MediaQuery.of(context).size.height;
// //     var width = MediaQuery.of(context).size.width;
// //     return Container(
// //       height: height,
// //       width: width,
// //       child: Scaffold(
// //         key: _scaffoldKey,
// //         body: Stack(
// //           children: <Widget>[
// //             // Map View
// //             GoogleMap(
// //               markers: Set<Marker>.from(markers),
// //               initialCameraPosition: _initialLocation,
// //               myLocationEnabled: true,
// //               myLocationButtonEnabled: false,
// //               mapType: MapType.normal,
// //               zoomGesturesEnabled: true,
// //               zoomControlsEnabled: false,
// //               polylines: Set<Polyline>.of(polylines.values),
// //               onMapCreated: (GoogleMapController controller) {
// //                 mapController = controller;
// //               },
// //             ),
// //             // Show zoom buttons
// //             SafeArea(
// //               child: Padding(
// //                 padding: const EdgeInsets.only(left: 10.0),
// //                 child: Column(
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: <Widget>[
// //                     ClipOval(
// //                       child: Material(
// //                         color: Colors.blue.shade100, // button color
// //                         child: InkWell(
// //                           splashColor: Colors.blue, // inkwell color
// //                           child: SizedBox(
// //                             width: 50,
// //                             height: 50,
// //                             child: Icon(Icons.add),
// //                           ),
// //                           onTap: () {
// //                             mapController.animateCamera(
// //                               CameraUpdate.zoomIn(),
// //                             );
// //                           },
// //                         ),
// //                       ),
// //                     ),
// //                     SizedBox(height: 20),
// //                     ClipOval(
// //                       child: Material(
// //                         color: Colors.blue.shade100, // button color
// //                         child: InkWell(
// //                           splashColor: Colors.blue, // inkwell color
// //                           child: SizedBox(
// //                             width: 50,
// //                             height: 50,
// //                             child: Icon(Icons.remove),
// //                           ),
// //                           onTap: () {
// //                             mapController.animateCamera(
// //                               CameraUpdate.zoomOut(),
// //                             );
// //                           },
// //                         ),
// //                       ),
// //                     )
// //                   ],
// //                 ),
// //               ),
// //             ),
// //             // Show the place input fields & button for
// //             // showing the route
// //             SafeArea(
// //               child: Align(
// //                 alignment: Alignment.topCenter,
// //                 child: Padding(
// //                   padding: const EdgeInsets.only(top: 10.0),
// //                   child: Container(
// //                     decoration: BoxDecoration(
// //                       color: Colors.white70,
// //                       borderRadius: BorderRadius.all(
// //                         Radius.circular(20.0),
// //                       ),
// //                     ),
// //                     width: width * 0.9,
// //                     child: Padding(
// //                       padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
// //                       child: Column(
// //                         mainAxisSize: MainAxisSize.min,
// //                         children: <Widget>[
// //                           Text(
// //                             'Places',
// //                             style: TextStyle(fontSize: 20.0),
// //                           ),
// //                           SizedBox(height: 10),
// //                           _textField(
// //                               label: 'Start',
// //                               hint: 'Choose starting point',
// //                               prefixIcon: Icon(Icons.looks_one),
// //                               suffixIcon: IconButton(
// //                                 icon: Icon(Icons.my_location),
// //                                 onPressed: () {
// //                                   startAddressController.text = _currentAddress;
// //                                   _startAddress = _currentAddress;
// //                                 },
// //                               ),
// //                               controller: startAddressController,
// //                               focusNode: startAddressFocusNode,
// //                               width: width,
// //                               locationCallback: (String value) {
// //                                 setState(() {
// //                                   _startAddress = value;
// //                                 });
// //                               }),
// //                           SizedBox(height: 10),
// //                           _textField(
// //                               label: 'Destination',
// //                               hint: 'Choose destination',
// //                               prefixIcon: Icon(Icons.looks_two),
// //                               controller: destinationAddressController,
// //                               focusNode: desrinationAddressFocusNode,
// //                               width: width,
// //                               locationCallback: (String value) {
// //                                 setState(() {
// //                                   _destinationAddress = value;
// //                                 });
// //                               }),
// //                           SizedBox(height: 10),
// //                           Visibility(
// //                             visible: _placeDistance == null ? false : true,
// //                             child: Text(
// //                               'DISTANCE: $_placeDistance km',
// //                               style: TextStyle(
// //                                 fontSize: 16,
// //                                 fontWeight: FontWeight.bold,
// //                               ),
// //                             ),
// //                           ),
// //                           SizedBox(height: 5),
// //                           ElevatedButton(
// //                             onPressed: (_startAddress != '' &&
// //                                     _destinationAddress != '')
// //                                 ? () async {
// //                                     startAddressFocusNode.unfocus();
// //                                     desrinationAddressFocusNode.unfocus();
// //                                     setState(() {
// //                                       if (markers.isNotEmpty) markers.clear();
// //                                       if (polylines.isNotEmpty)
// //                                         polylines.clear();
// //                                       if (polylineCoordinates.isNotEmpty)
// //                                         polylineCoordinates.clear();
// //                                       _placeDistance = null;
// //                                     });

// //                                     _calculateDistance().then((isCalculated) {
// //                                       if (isCalculated) {
// //                                         ScaffoldMessenger.of(context)
// //                                             .showSnackBar(
// //                                           SnackBar(
// //                                             content: Text(
// //                                                 'Distance Calculated Sucessfully'),
// //                                           ),
// //                                         );
// //                                       } else {
// //                                         ScaffoldMessenger.of(context)
// //                                             .showSnackBar(
// //                                           SnackBar(
// //                                             content: Text(
// //                                                 'Error Calculating Distance'),
// //                                           ),
// //                                         );
// //                                       }
// //                                     });
// //                                   }
// //                                 : null,
// //                             child: Padding(
// //                               padding: const EdgeInsets.all(8.0),
// //                               child: Text(
// //                                 'Show Route'.toUpperCase(),
// //                                 style: TextStyle(
// //                                   color: Colors.white,
// //                                   fontSize: 20.0,
// //                                 ),
// //                               ),
// //                             ),
// //                             style: ElevatedButton.styleFrom(
// //                               primary: Colors.red,
// //                               shape: RoundedRectangleBorder(
// //                                 borderRadius: BorderRadius.circular(20.0),
// //                               ),
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ),
// //             // Show current location button
// //             SafeArea(
// //               child: Align(
// //                 alignment: Alignment.bottomRight,
// //                 child: Padding(
// //                   padding: const EdgeInsets.only(right: 10.0, bottom: 10.0),
// //                   child: ClipOval(
// //                     child: Material(
// //                       color: Colors.orange.shade100, // button color
// //                       child: InkWell(
// //                         splashColor: Colors.orange, // inkwell color
// //                         child: SizedBox(
// //                           width: 56,
// //                           height: 56,
// //                           child: Icon(Icons.my_location),
// //                         ),
// //                         onTap: () {
// //                           mapController.animateCamera(
// //                             CameraUpdate.newCameraPosition(
// //                               CameraPosition(
// //                                 target: LatLng(
// //                                   _currentPosition.latitude,
// //                                   _currentPosition.longitude,
// //                                 ),
// //                                 zoom: 18.0,
// //                               ),
// //                             ),
// //                           );
// //                         },
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
