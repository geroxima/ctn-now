import 'dart:math';

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class MapsDemo extends StatefulWidget {
  static const String ACCESS_TOKEN =
      "pk.eyJ1IjoiZ2Vyb29vMDAiLCJhIjoiY2w1bXBndXJiMGNqNTNrbnY2c2JvanZwOCJ9.yL4LJA1nTn35lgfdSFHi8Q";

  const MapsDemo({Key? key}) : super(key: key);
  @override
  State<MapsDemo> createState() => _MapsDemoState();
}

class _MapsDemoState extends State<MapsDemo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

abstract class ExamplePage extends StatelessWidget {
  const ExamplePage(this.leading, this.title);

  final Widget leading;
  final String title;
}

class FullMapPage extends ExamplePage {
  const FullMapPage() : super(const Icon(Icons.map), 'Full screen map');

  @override
  Widget build(BuildContext context) {
    return const FullMap();
  }
}

class FullMap extends StatefulWidget {
  const FullMap();

  @override
  State createState() => FullMapState();
}

class FullMapState extends State<FullMap> {
  MapboxMapController? mapController;
  var isLight = true;

  _onMapCreated(MapboxMapController controller) {
    mapController = controller;
  }

  _onStyleLoadedCallback() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text("Style loaded :)"),
      backgroundColor: Theme.of(context).primaryColor,
      duration: const Duration(seconds: 0),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(32.0),
          child: FloatingActionButton(
            child: const Icon(Icons.swap_horiz),
            onPressed: () => setState(
              () => isLight = !isLight,
            ),
          ),
        ),
        body: MapboxMap(
          styleString: "mapbox://styles/gerooo00/cl3xco6zz001214mg7qo8um0u",
          accessToken: MapsDemo.ACCESS_TOKEN,
          onMapCreated: _onMapCreated,
          initialCameraPosition: const CameraPosition(
            target: LatLng(-27.311822, -55.895227),
            zoom: 16.5,
            tilt: 100,
          ),
          onStyleLoadedCallback: _onStyleLoadedCallback,
        ));
  }
}
