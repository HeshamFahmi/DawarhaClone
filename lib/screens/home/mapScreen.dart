// ignore_for_file: avoid_print, file_names

import 'dart:async';
import 'dart:typed_data';

import 'package:dawarha/constants.dart';
import 'package:dawarha/data/markerasset.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../data/locations.dart' as locations;
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: _onMapCreated,
        markers: _markers.values.toSet(),
        myLocationEnabled: true,
      ),
      floatingActionButton: _getFAB(),
    );
  }

  final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    final Uint8List markerIcon = await getBytesFromAsset(logoAsset, 100);
    final googleOffices = await locations.getGoogleOffices();
    setState(() {
      _markers.clear();
      for (final office in googleOffices.offices) {
        final marker = Marker(
          markerId: MarkerId(office.name),
          position: LatLng(office.lat, office.lng),
          icon: BitmapDescriptor.fromBytes(markerIcon),
          infoWindow: InfoWindow(
            title: office.name,
            snippet: office.address,
          ),
        );
        _markers[office.name] = marker;
      }
    });
  }

  Widget _getFAB() {
    return SpeedDial(
      animatedIcon: AnimatedIcons.search_ellipsis,
      animatedIconTheme: const IconThemeData(size: 22),
      backgroundColor: Colors.green,
      visible: true,
      curve: Curves.bounceIn,
      children: [
        customSpeedDial(
            'Nearest Redeemer', const Icon(Icons.assignment_turned_in)),
        customSpeedDial('Nearest Recycle Machine', const Icon(Icons.refresh)),
      ],
    );
  }
}
