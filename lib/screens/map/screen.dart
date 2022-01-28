import 'package:flutter_desktop_map/screens/map/widgets/marker.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'widgets/attribution.dart';
import 'func/dialog.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? pickedLocation;

  @override
  void initState() {
    pickedLocation = LatLng(-8.849163, 13.279163);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          center: pickedLocation,
          minZoom: 12,
          maxZoom: 18,
          onTap: (tapPos, location) {
            setState(
              () {
                pickedLocation = LatLng(
                  location.latitude,
                  location.longitude,
                );
              },
            );
          },
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
            attributionBuilder: (_) {
              return const AttributionWidget(
                description: '© OpenStreetMap contributors',
              );
            },
          ),
          MarkerLayerOptions(
            markers: [
              markerBuilder(
                location: pickedLocation,
                onTap: () {
                  infoDialog(
                    context: context,
                    pickedLocation: pickedLocation,
                  );
                },
              )
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          infoDialog(
            context: context,
            pickedLocation: pickedLocation,
          );
        },
        child: const Icon(
          Icons.map,
          color: Colors.white,
        ),
      ),
    );
  }
}
